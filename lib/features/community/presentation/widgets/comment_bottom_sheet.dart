import 'package:ezycourse_community/core/theme/app_colors.dart';
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
      backgroundColor: Colors.transparent,
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

      _commentController.clear();

      await ref
          .read(feedCommentViewmodelProvider.notifier)
          .fetchFeedComments(feedId: widget.feedId);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to post comment: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final commentState = ref.watch(feedCommentViewmodelProvider);
    final createCommentState = ref.watch(createFeedCommentViewmodelProvider);

    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          // Handle bar
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.cardBorder,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 12, 12),
            child: Row(
              children: [
                Text(
                  'Comments',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close_rounded, color: AppColors.textGrey),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.surface,
                  ),
                ),
              ],
            ),
          ),

          Divider(height: 1, color: AppColors.cardBorder),

          // Comments list
          Expanded(
            child: commentState.isLoading
                ? Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  )
                : commentState.comments.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.chat_bubble_outline_rounded,
                              size: 40,
                              color: AppColors.textGreyLight,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'No comments yet',
                              style: TextStyle(
                                color: AppColors.textGrey,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Be the first to comment',
                              style: TextStyle(
                                color: AppColors.textGreyLight,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      )
                    : CommentCard(comments: commentState.comments),
          ),

          // Input
          Container(
            padding: EdgeInsets.fromLTRB(
              16,
              12,
              12,
              MediaQuery.of(context).padding.bottom + 12,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: AppColors.cardBorder)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: 'Write a comment...',
                      hintStyle: TextStyle(color: AppColors.textGreyLight),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(color: AppColors.cardBorder),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(color: AppColors.cardBorder),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(color: AppColors.primary),
                      ),
                      filled: true,
                      fillColor: AppColors.surface,
                    ),
                    onSubmitted: (_) => _sendComment(),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed:
                        createCommentState.isLoading ? null : _sendComment,
                    icon: createCommentState.isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Icon(
                            Icons.send_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
