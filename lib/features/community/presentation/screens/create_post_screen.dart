import 'package:ezycourse_community/features/community/presentation/viewmodel/community_feed_viewmodel.dart';
import 'package:ezycourse_community/features/community/presentation/viewmodel/create_post_viewmodel.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/create_post_user.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/media_picker_section.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/media_picker_widget.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/post_content_card.dart';
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
  List<PickedMedia> _mediaList = [];

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }


  Future<void> _handlePost() async {
    final postText = _textController.text.trim();

    if (postText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please write something')),
      );
      return;
    }

    try {
      final files = buildFileMetadata(_mediaList);

      await ref
          .read(createPostViewmodelProvider.notifier)
          .createPost(
            postText: postText,
            spaceId: widget.spaceId,
            communityId: widget.communityId,
            files: files,
          );

      if (mounted) {
        await ref
            .read(feedViewModelProvider.notifier)
            .fetchFeeds(widget.communityId, widget.spaceId);
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
    final isLoading = createPostState.isLoading;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Create Post',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Center(
              child: ElevatedButton(
                onPressed: isLoading ? null : _handlePost,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  disabledBackgroundColor: Colors.grey,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      )
                    : const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.check, size: 18),
                          SizedBox(width: 6),
                          Text('Post'),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // User info
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const CreatePostUserInfo(),
              ),
              const SizedBox(height: 16),

              // Text input
              PostContentCard(
                textController: _textController,
                isLoading: isLoading,
              ),
              const SizedBox(height: 20),

              // Media picker (thumbnails + action buttons)
              MediaPickerSection(
                isLoading: isLoading,
                onMediaChanged: (media) => _mediaList = media,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
