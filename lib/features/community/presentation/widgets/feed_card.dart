import 'package:ezycourse_community/core/theme/app_colors.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/feed_file_handler.dart';
import 'package:flutter/material.dart';
import 'package:ezycourse_community/features/community/domain/entities/feed_entity.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/feed_author_header.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/engagement_bar.dart';

class FeedCard extends StatefulWidget {
  final FeedEntity feed;
  final VoidCallback? onLike;
  final VoidCallback? onComment;
  final VoidCallback? onShare;

  const FeedCard({
    super.key,
    required this.feed,
    this.onLike,
    this.onComment,
    this.onShare,
  });

  @override
  State<FeedCard> createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Author header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 12, 0),
            child: AuthorHeader(feed: widget.feed),
          ),

          // Post content
          if (widget.feed.feedText.isNotEmpty) ...[
            const SizedBox(height: 10),
            _buildPostContent(),
          ],

          // Files
          if (widget.feed.files.isNotEmpty) ...[
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: FeedFileHandler(files: widget.feed.files),
            ),
          ],

          // Engagement bar
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: EngagementBar(
              feed: widget.feed,
              onLike: widget.onLike,
              onComment: widget.onComment,
              onShare: widget.onShare,
              userReaction: widget.feed.like?.reactionType,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () => setState(() => _isExpanded = !_isExpanded),
        child: Text(
          widget.feed.feedText,
          style: TextStyle(
            fontSize: 14,
            height: 1.5,
            color: AppColors.textDark,
          ),
          maxLines: _isExpanded ? null : 3,
          overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
