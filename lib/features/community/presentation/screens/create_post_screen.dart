import 'package:ezycourse_community/features/community/presentation/viewmodel/create_post_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePostScreen extends ConsumerStatefulWidget {
  const CreatePostScreen({super.key});

  @override
  ConsumerState<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends ConsumerState<CreatePostScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();

    super.dispose();
  }

  Future<void> _handlePost() async {
    final postText = _textController.text.trim();

    if (postText.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please write something')));
      return;
    }

    try {
      await ref
          .read(createPostViewmodelProvider.notifier)
          .createPost(postText: postText);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Post created successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to create post: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final createPostState = ref.watch(createPostViewmodelProvider);
    final isLoading = createPostState.isLoading;

    return Scaffold(
      appBar: AppBar(
        title: Text('CREATE POST'),
        actions: [
          IconButton(
            onPressed: () async {
              await _handlePost();
            },
            icon: Icon(Icons.send),
          ),
          const SizedBox(width: 12),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,

              maxLines: null,
              minLines: 8,
              style: const TextStyle(fontSize: 12, height: 1.3),
              decoration: const InputDecoration(
                hintText: "What's on your mind?",
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
