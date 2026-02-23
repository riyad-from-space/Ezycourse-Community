import 'package:ezycourse_community/features/community/presentation/widgets/comment_bottom_sheet.dart';
import 'package:ezycourse_community/features/community/presentation/viewmodel/create_post_react_viewmodel.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/reaction_picker.dart';
import 'package:flutter/material.dart';
import 'package:ezycourse_community/features/community/domain/entities/feed_entity.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/feed_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedList extends ConsumerStatefulWidget {
  final List<FeedEntity> feeds;
  final VoidCallback? onRefresh;

  const FeedList({super.key, required this.feeds, this.onRefresh});

  @override
  ConsumerState<FeedList> createState() => _FeedListState();
}

class _FeedListState extends ConsumerState<FeedList> {
  @override
  Widget build(BuildContext context) {
    if (widget.onRefresh != null) {
      return RefreshIndicator(
        onRefresh: () async => widget.onRefresh?.call(),
        child: _buildList(),
      );
    }

    return _buildList();
  }

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: widget.feeds.length,
      itemBuilder: (context, index) {
        final feed = widget.feeds[index];
        return FeedCard(
          feed: feed,
          onLike: () => _showReactionPicker(feed),
          onComment: () => _handleComment(context, feed),
          onShare: () => _handleShare(feed),
          onMenuTap: () => _handleMenu(feed),
        );
      },
    );
  }

  void _showReactionPicker(FeedEntity feed) {
    ReactionPicker.show(
      context,
      onReactionSelected: (reactionType, emoji) {
        _handleReaction(feed, reactionType, emoji);
      },
    );
  }

  void _handleReaction(
    FeedEntity feed,
    String reactionType,
    String emoji,
  ) async {
    try {
      // Call API to add reaction
      await ref
          .read(createPostReactViewmodelProvider.notifier)
          .createPostReact(feedId: feed.id, reactType: reactionType);

      // Show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Reacted with $emoji'),
            duration: const Duration(seconds: 1),
            backgroundColor: Colors.green,
          ),
        );
      }

      // Refresh the feed to get accurate data from server
      widget.onRefresh?.call();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to add reaction'),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _handleComment(BuildContext context, FeedEntity feed) {
    CommentBottomSheet.show(context, feed.id);
    debugPrint('Comment tapped for feed ${feed.id}');
  }

  void _handleShare(FeedEntity feed) {
    debugPrint('Share tapped for feed ${feed.id}');
  }

  void _handleMenu(FeedEntity feed) {
    debugPrint('Menu tapped for feed ${feed.id}');
  }
}
