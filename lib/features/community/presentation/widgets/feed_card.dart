import 'package:ezycourse_community/features/community/presentation/widgets/feed_file_handler.dart';
import 'package:flutter/material.dart';
import 'package:ezycourse_community/features/community/domain/entities/feed_entity.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/feed_author_header.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/engagement_bar.dart';

class FeedCard extends StatelessWidget {
  final FeedEntity feed;
  final VoidCallback? onLike;
  final VoidCallback? onComment;
  final VoidCallback? onShare;
  final VoidCallback? onMenuTap;

  const FeedCard({
    super.key,
    required this.feed,
    this.onLike,
    this.onComment,
    this.onShare,
    this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Author header
            AuthorHeader(feed: feed, onMenuTap: onMenuTap),

            // Post content
            if (feed.feedText.isNotEmpty) ...[
              const SizedBox(height: 12),
              _buildPostContent(),
            ],

            // Engagement bar (likes, comments)
            const SizedBox(height: 8),
            EngagementBar(
              feed: feed,
              onLike: onLike,
              onComment: onComment,
              onShare: onShare,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostContent() {
    return feed.files.isNotEmpty ? FeedFileHandler(
      files: feed.files,
    ) : Text(
      feed.feedText,
      style: const TextStyle(fontSize: 15, height: 1.4),
    );
  }
}
