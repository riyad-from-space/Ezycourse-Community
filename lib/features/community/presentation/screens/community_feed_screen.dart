import 'package:ezycourse_community/features/community/domain/entities/community_channel_entity.dart';
import 'package:ezycourse_community/features/community/presentation/viewmodel/community_channel_viewmodel.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/channel_drawer.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/create_post_field.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/feed_list.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/bottom_navbar.dart';
import 'package:ezycourse_community/features/community/presentation/viewmodel/community_feed_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedScreen extends ConsumerStatefulWidget {
  final int communityId;

  const FeedScreen({super.key, required this.communityId});
  @override
  ConsumerState<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends ConsumerState<FeedScreen> {
  int _currentIndex = 0;
  List<CommunityChannelEntity> channels = [];

  bool _channelsLoaded = false;

  @override
  void initState() {
    super.initState();
    // Reset flag for new community
    _channelsLoaded = false;

    // ✅ All reset and load operations in single microtask
    Future.microtask(() {
      // ref.read(feedViewModelProvider.notifier).resetFeed();
      // ref.read(communityChannelViewmodelProvider.notifier).resetChannel();
      ref
          .read(communityChannelViewmodelProvider.notifier)
          .fetchCommunityChannels(communityId: widget.communityId);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void loadFeeds( int spaceId) {
    Future.microtask(() {
      ref
          .read(feedViewModelProvider.notifier)
          .fetchFeeds(widget.communityId, spaceId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final feedState = ref.watch(feedViewModelProvider);
    final channelState = ref.watch(communityChannelViewmodelProvider);
    if (!channelState.isLoading &&
        channelState.channels.isNotEmpty &&
        !_channelsLoaded) {
      channels = channelState.channels;
      _channelsLoaded = true;
      final spaceId = channels.first.channelId;
      loadFeeds(spaceId );
    }

    return Scaffold(
      drawer: ChannelDrawer(channels:channels, onChannelSelected: loadFeeds),
      appBar: AppBar(title: const Text('Community Feed')),
      body: (channelState.isLoading || feedState.isLoading)
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                CreatePostField(),

                Expanded(child: FeedList(feeds: feedState.feeds)),
              ],
            ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onIndexChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
