import 'package:ezycourse_community/features/community/presentation/viewmodel/community_list_viewmodel.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/community_list_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommunityListScreen extends ConsumerStatefulWidget {
  const CommunityListScreen({super.key});
  @override
  ConsumerState<CommunityListScreen> createState() =>
      _CommunityListScreenState();
}

class _CommunityListScreenState extends ConsumerState<CommunityListScreen> {
  final ScrollController _scrollController = ScrollController();
  late bool hasMoreData ;
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref
          .read(communityListViewModelProvider.notifier)
          .fetchCommunityList();
    });

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
          hasMoreData=true;
      ref.read(communityListViewModelProvider.notifier)
          .fetchCommunityList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final communityListState = ref.watch(communityListViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Communities',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref
                  .read(communityListViewModelProvider.notifier)
                  .fetchCommunityList();
            },
          ),
        ],
      ),
      body: _buildBody(communityListState),
    );
  }

  Widget _buildBody(CommunityListState state) {
    if (state.isLoading && state.communityList.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.errorMessage != null && state.communityList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 60, color: Colors.red[300]),
            const SizedBox(height: 16),
            Text('Error: ${state.errorMessage}', textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                ref
                    .read(communityListViewModelProvider.notifier)
                    .fetchCommunityList();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (state.communityList.isEmpty) {
      return Center(child: const Text('No communities yet'));
    }

    return RefreshIndicator(
      onRefresh: () async {
        // await ref
        //     .read(communityListViewModelProvider.notifier)
        //     .refreshCommunityList();
      },
      child: ListView(
        controller: _scrollController,
        padding: const EdgeInsets.all(8),
        children: [
          // Community grid
          CommunityListCard(communities: state.communityList),

          // Loading indicator for pagination
          if (state.isLoadingMore)
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            ),

          // No more data indicator
          if (!state.hasMoreData && state.communityList.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: Text(
                'No more communities to load',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
        ],
      ),
    );
  }
}
