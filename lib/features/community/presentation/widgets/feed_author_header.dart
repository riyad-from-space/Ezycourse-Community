import 'package:ezycourse_community/core/theme/app_colors.dart';
import 'package:ezycourse_community/features/community/domain/entities/feed_entity.dart';
import 'package:ezycourse_community/features/community/presentation/utils/time_formatter.dart';
import 'package:flutter/material.dart';

class AuthorHeader extends StatelessWidget {
  final FeedEntity feed;

  const AuthorHeader({super.key, required this.feed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.primary.withValues(alpha: 0.1),
          backgroundImage:
              feed.userPic.isNotEmpty ? NetworkImage(feed.userPic) : null,
          child: feed.userPic.isEmpty
              ? Text(
                  TimeFormatter.getInitials(feed.userName),
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                )
              : null,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                feed.userName,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                TimeFormatter.formatRelativeTime(feed.createdAt),
                style: TextStyle(
                  color: AppColors.textGreyLight,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
