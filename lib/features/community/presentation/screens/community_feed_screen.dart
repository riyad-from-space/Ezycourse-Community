import 'package:ezycourse_community/core/theme/app_colors.dart';
import 'package:ezycourse_community/core/theme/app_text_styles.dart';
import 'package:ezycourse_community/features/community/domain/entities/community_channel_entity.dart';
import 'package:ezycourse_community/features/community/presentation/screens/create_post_screen.dart';
import 'package:ezycourse_community/features/community/presentation/viewmodel/community_channel_viewmodel.dart';
import 'package:ezycourse_community/features/community/presentation/viewmodel/community_feed_viewmodel.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/channel_drawer.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/create_post_field.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/feed_list.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedScreen extends ConsumerStatefulWidget {
  final int communityId;
  final String communityName;
  final String coverImage;

  const FeedScreen({
    super.key,
    required this.communityId,
    required this.communityName,
    required this.coverImage,
  });

  @override
  ConsumerState<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends ConsumerState<FeedScreen> {
  int _currentIndex = 0;
  List<CommunityChannelEntity> _channels = [];
  bool _channelsLoaded = false;
  int? _activeChannelId;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(communityChannelViewmodelProvider.notifier)
          .fetchCommunityChannels(communityId: widget.communityId);
    });
  }

  void _loadFeeds(int spaceId) {
    setState(() => _activeChannelId = spaceId);
    ref
        .read(feedViewModelProvider.notifier)
        .fetchFeeds(widget.communityId, spaceId);
  }

  void _refreshFeeds() {
    if (_activeChannelId != null) {
      _loadFeeds(_activeChannelId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final feedState = ref.watch(feedViewModelProvider);
    final channelState = ref.watch(communityChannelViewmodelProvider);

    // Load feeds once channels arrive
    if (!channelState.isLoading &&
        channelState.channels.isNotEmpty &&
        !_channelsLoaded) {
      _channels = channelState.channels;
      _channelsLoaded = true;
      _activeChannelId = _channels.first.channelId;
      WidgetsBinding.instance
          .addPostFrameCallback((_) => _loadFeeds(_channels.first.channelId));
    }

    final isLoading =
        feedState.isLoading || !_channelsLoaded || !feedState.hasFetched;

    return Scaffold(
      backgroundColor: AppColors.surface,
      drawer: ChannelDrawer(
        channels: _channels,
        onChannelSelected: _loadFeeds,
        activeChannelId: _activeChannelId,
        coverImage: widget.coverImage,
      ),
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0.5,
        title: Text(
          widget.communityName.isNotEmpty ? widget.communityName : 'Feed',
          style: AppTextStyles.screenTitle,
        ),
        centerTitle: false,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            )
          : _buildContent(feedState),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onIndexChanged: (index) => setState(() => _currentIndex = index),
      ),
    );
  }

  Widget _buildContent(FeedState feedState) {
    if (feedState.errorMessage != null && feedState.feeds.isEmpty) {
      return _buildErrorState(feedState.errorMessage!);
    }

    return Column(
      children: [
        // Create post
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreatePostScreen(
                communityId: widget.communityId,
                spaceId: _channels[_currentIndex].channelId,
              ),
            ),
          ),
          child: const CreatePostField(),
        ),

        Divider(height: 1, color: AppColors.cardBorder),

        // Feed list
        Expanded(
          child: feedState.feeds.isEmpty
              ? _buildEmptyState()
              : FeedList(
                  feeds: feedState.feeds,
                  onRefresh: _refreshFeeds,
                ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.article_outlined,
            size: 56,
            color: AppColors.primary.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 16),
          Text(
            'No posts yet',
            style: AppTextStyles.screenTitle.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 6),
          Text(
            'Be the first to share something!',
            style: AppTextStyles.screenSubtitle,
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cloud_off_rounded,
              size: 48,
              color: AppColors.error.withValues(alpha: 0.7),
            ),
            const SizedBox(height: 16),
            Text(
              'Failed to load feeds',
              style: AppTextStyles.screenTitle.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 6),
            Text(
              message,
              style: AppTextStyles.screenSubtitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: _refreshFeeds,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.refresh_rounded, size: 20),
              label: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}
