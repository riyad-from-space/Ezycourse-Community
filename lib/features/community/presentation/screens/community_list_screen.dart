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
  @override
  void initState() {
    super.initState();
    print('🔵 CommunityListScreen initState called');
    _loadCommunityList();
  }

  void _loadCommunityList() {
    Future.microtask(() {
      ref.read(communityListViewModelProvider.notifier).fetchCommunityList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final communityListState = ref.watch(communityListViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Community',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: communityListState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  CommunityListCard(
                    communities: communityListState.communityList,
                  ),
                ],
              ),
            ),
    );
  }
}
