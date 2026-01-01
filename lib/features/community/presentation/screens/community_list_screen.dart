import 'package:ezycourse_community/features/community/presentation/viewmodel/community_list_viewmodel.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/community_list_card.dart';


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommunityListScreen extends ConsumerStatefulWidget{
  const CommunityListScreen({super.key});
  @override
  ConsumerState<CommunityListScreen> createState() => _CommunityListScreenState();
  
}

class _CommunityListScreenState extends ConsumerState<CommunityListScreen>{

  @override 
  void initState() {
    super.initState();
    print('🔵 CommunityListScreen initState called');
    _loadCommunityList();
    
  }

  void _loadCommunityList(){
    print('🔵 Loading community list...');
    Future.microtask((){
      ref.read(communityListViewModelProvider.notifier).fetchCommunityList();

    });
  }
  
  @override
  Widget build(BuildContext context) {
    final communityListState= ref.watch(communityListViewModelProvider);
    print('🟢 Build called - isLoading: ${communityListState.isLoading}');
    print('🟢 Communities count: ${communityListState.communityList.length}');
    print('🟢 Error: ${communityListState.errorMessage}');


    return Scaffold(
      appBar: AppBar(
        title: const Text('Enrolled Comunities'),
      ),
      body: communityListState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: CommunityListCard(
                communities: communityListState.communityList,
              ),
            ),
    );
  }
}