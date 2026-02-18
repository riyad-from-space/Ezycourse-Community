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
    // Determine icon and color based on user's reaction
    final hasReacted = userReaction != null;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey[200]!),
          bottom: BorderSide(color: Colors.grey[200]!),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onLongPress: onLike,
            child: Row(
              children: [
                userReaction != null
                    ? Text(
                        _getReactionEmoji(userReaction!),
                        style: const TextStyle(fontSize: 18),
                      )
                    : Icon(
                        Icons.thumb_up_alt_outlined,
                        size: 20,
                        color: Colors.grey[600],
                      ),

                const SizedBox(width: 6),
                Text(
                  '${feed.likeCount}',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: hasReacted
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: onComment,
            child: Row(
              children: [
                Icon(Icons.comment_outlined, size: 20, color: Colors.grey[600]),
                const SizedBox(width: 6),
                Text(
                  '${feed.commentCount}',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: onShare,
            child: Row(
              children: [
                Icon(Icons.share_outlined, size: 20, color: Colors.grey[600]),
                const SizedBox(width: 6),
                Text(
                  '${feed.shareCount}',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
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
