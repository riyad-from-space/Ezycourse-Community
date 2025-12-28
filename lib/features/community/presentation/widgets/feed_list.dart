import 'package:flutter/material.dart';
import 'package:ezycourse_community/features/community/domain/entities/feed_entity.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/feed_card.dart';

class FeedList extends StatelessWidget {
  final List<FeedEntity> feeds;
  final VoidCallback? onRefresh;

  const FeedList({super.key, required this.feeds, this.onRefresh});

  @override
  Widget build(BuildContext context) {
    if (onRefresh != null) {
      return RefreshIndicator(
        onRefresh: () async => onRefresh?.call(),
        child: _buildList(),
      );
    }

    return _buildList();
  }

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: feeds.length,
      itemBuilder: (context, index) {
        final feed = feeds[index];
        return FeedCard(
          feed: feed,
          onLike: () => _handleLike(feed),
          onComment: () => _handleComment(feed),
          onShare: () => _handleShare(feed),
          onMenuTap: () => _handleMenu(feed),
        );
      },
    );
  }

  void _handleLike(FeedEntity feed) {
    // TODO: Implement like functionality
    debugPrint('Like tapped for feed ${feed.id}');
  }

  void _handleComment(FeedEntity feed) {
    // TODO: Implement comment functionality
    debugPrint('Comment tapped for feed ${feed.id}');
  }

  void _handleShare(FeedEntity feed) {
    // TODO: Implement share functionality
    debugPrint('Share tapped for feed ${feed.id}');
  }

  void _handleMenu(FeedEntity feed) {
    // TODO: Implement menu (edit, delete, report)
    debugPrint('Menu tapped for feed ${feed.id}');
  }
}
