import 'package:ezycourse_community/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:ezycourse_community/features/community/domain/entities/feed_entity.dart';

class EngagementBar extends StatelessWidget {
  final FeedEntity feed;
  final VoidCallback? onLike;
  final VoidCallback? onComment;
  final VoidCallback? onShare;
  final String? userReaction;

  const EngagementBar({
    super.key,
    required this.feed,
    this.onLike,
    this.onComment,
    this.onShare,
    this.userReaction,
  });

  @override
  Widget build(BuildContext context) {
    final hasReacted = userReaction != null;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.cardBorder),
        ),
      ),
      child: Row(
        children: [
          // Like
          _ActionButton(
            onTap: onLike,
            icon: hasReacted ? null : Icons.thumb_up_alt_outlined,
            emoji: hasReacted ? _getReactionEmoji(userReaction!) : null,
            label: '${feed.likeCount}',
            isActive: hasReacted,
          ),
          const SizedBox(width: 4),
          // Comment
          _ActionButton(
            onTap: onComment,
            icon: Icons.chat_bubble_outline_rounded,
            label: '${feed.commentCount}',
          ),
          const SizedBox(width: 4),
          // Share
          _ActionButton(
            onTap: onShare,
            icon: Icons.share_outlined,
            label: '${feed.shareCount}',
          ),
        ],
      ),
    );
  }

  String _getReactionEmoji(String reactionType) {
    switch (reactionType.toUpperCase()) {
      case 'LIKE':
        return '👍';
      case 'LOVE':
        return '❤️';
      case 'HAHA':
        return '😂';
      case 'WOW':
        return '😮';
      case 'SAD':
        return '😢';
      case 'ANGRY':
        return '😡';
      default:
        return '👍';
    }
  }
}

class _ActionButton extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData? icon;
  final String? emoji;
  final String label;
  final bool isActive;

  const _ActionButton({
    this.onTap,
    this.icon,
    this.emoji,
    required this.label,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (emoji != null)
                Text(emoji!, style: const TextStyle(fontSize: 16))
              else if (icon != null)
                Icon(
                  icon,
                  size: 18,
                  color: AppColors.textGrey,
                ),
              const SizedBox(width: 5),
              Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                  color: isActive ? AppColors.primary : AppColors.textGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
