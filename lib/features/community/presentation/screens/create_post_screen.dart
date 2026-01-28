import 'package:ezycourse_community/features/community/presentation/viewmodel/community_feed_viewmodel.dart';
import 'package:ezycourse_community/features/community/presentation/viewmodel/create_post_viewmodel.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/create_post_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePostScreen extends ConsumerStatefulWidget {
  final int communityId;
  final int spaceId;
  const CreatePostScreen({
    super.key,
    required this.communityId,
    required this.spaceId,
  });

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
          .createPost(
            postText: postText,
            spaceId: widget.spaceId,
            communityId: widget.communityId,
          );

          if(mounted) {
            await ref.read(feedViewModelProvider.notifier).fetchFeeds(widget.communityId, widget.spaceId);
          }

          

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

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Create Post',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            )),
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
        padding: const EdgeInsets.all(12),
        child: Column(

          children: [
            const CreatePostUserInfo(),

            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
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
            ),
          ],
        ),
      ),
    );
  }
}
