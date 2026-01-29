import 'package:ezycourse_community/features/community/presentation/viewmodel/feed_comment_viewmodel.dart';
import 'package:ezycourse_community/features/community/presentation/viewmodel/create_feed_comment_viewmodel.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/comment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentBottomSheet extends ConsumerStatefulWidget {
  final int feedId;
  const CommentBottomSheet({super.key, required this.feedId});

  @override
  ConsumerState<CommentBottomSheet> createState() => _CommentBottomSheetState();

  static void show(BuildContext context, int feedId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: CommentBottomSheet(feedId: feedId),
        );
      },
    );
  }
}

class _CommentBottomSheetState extends ConsumerState<CommentBottomSheet> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref
          .read(feedCommentViewmodelProvider.notifier)
          .fetchFeedComments(feedId: widget.feedId),
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _sendComment() async {
    final commentText = _commentController.text.trim();
    if (commentText.isEmpty) return;

    try {
      await ref
          .read(createFeedCommentViewmodelProvider.notifier)
          .createFeedComment(
            commentText: commentText,
            feedId: widget.feedId,
          );

      // Clear the text field after successful send
      _commentController.clear();

      // Refresh comments
      await ref
          .read(feedCommentViewmodelProvider.notifier)
          .fetchFeedComments(feedId: widget.feedId);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Comment posted successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to post comment: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final commentState = ref.watch(feedCommentViewmodelProvider);
    final createCommentState = ref.watch(createFeedCommentViewmodelProvider);

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Comments',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
      
            // Comments content
            Expanded(
              child: commentState.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : commentState.comments.isEmpty
                      ? const Center(child: Text('No comments yet'))
                      : CommentCard(comments: commentState.comments),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _commentController,
                        decoration: InputDecoration(
                          hintText: 'Write a comment...',
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                        ),
                        onSubmitted: (_) => _sendComment(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: createCommentState.isLoading ? null : _sendComment,
                        icon: createCommentState.isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Icon(Icons.send, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
