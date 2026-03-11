import 'package:ezycourse_community/core/theme/app_colors.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/comment_bottom_sheet.dart';
import 'package:ezycourse_community/features/community/presentation/viewmodel/community_feed_viewmodel.dart';
import 'package:ezycourse_community/features/community/presentation/viewmodel/create_post_react_viewmodel.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/reaction_picker.dart';
import 'package:flutter/material.dart';
import 'package:ezycourse_community/features/community/domain/entities/feed_entity.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/feed_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedList extends ConsumerWidget {
  final List<FeedEntity> feeds;
  final VoidCallback? onRefresh;

  const FeedList({super.key, required this.feeds, this.onRefresh});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      itemCount: feeds.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final feed = feeds[index];
        return FeedCard(
          feed: feed,
          onLike: () => _showReactionPicker(context, ref, feed),
          onComment: () => CommentBottomSheet.show(context, feed.id),
          onShare: () {},
        );
      },
    );

    if (onRefresh != null) {
      return RefreshIndicator(
        color: AppColors.primary,
        onRefresh: () async => onRefresh?.call(),
        child: list,
      );
    }
    return list;
  }

  void _showReactionPicker(
      BuildContext context, WidgetRef ref, FeedEntity feed) {
    ReactionPicker.show(
      context,
      currentReaction: feed.like?.reactionType,
      onReactionSelected: (reactionType, emoji) {
        // Optimistic update — instant UI change
        ref
            .read(feedViewModelProvider.notifier)
            .updateReaction(feed.id, reactionType);

        // Fire API in background
        ref
            .read(createPostReactViewmodelProvider.notifier)
            .createPostReact(feedId: feed.id, reactType: reactionType);
      },
    );
  }
}
