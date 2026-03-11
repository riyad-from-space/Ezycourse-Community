import 'package:ezycourse_community/core/theme/app_colors.dart';
import 'package:ezycourse_community/features/community/domain/entities/feed_comment_entity.dart';
import 'package:ezycourse_community/features/community/presentation/utils/time_formatter.dart';
import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {
  final List<FeedCommentEntity> comments;
  const CommentCard({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      itemCount: comments.length,
      separatorBuilder: (_, __) => Divider(
        height: 1,
        color: AppColors.cardBorder,
      ),
      itemBuilder: (context, index) {
        final comment = comments[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                backgroundImage: comment.user.profilePic.isNotEmpty
                    ? NetworkImage(comment.user.profilePic)
                    : null,
                child: comment.user.profilePic.isEmpty
                    ? Text(
                        TimeFormatter.getInitials(comment.user.fullName),
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      )
                    : null,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        comment.user.fullName,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: AppColors.textDark,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        comment.commentText,
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.4,
                          color: AppColors.textDark,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
