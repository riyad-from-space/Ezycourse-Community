import 'package:ezycourse_community/features/community/presentation/widgets/create_post_field.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/feed_list.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/bottom_navbar.dart';
import 'package:ezycourse_community/features/community/presentation/viewmodel/community_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedScreen extends ConsumerStatefulWidget{
  const FeedScreen({super.key});
  @override
  ConsumerState<FeedScreen> createState() => _FeedScreenState();
  
}

class _FeedScreenState extends ConsumerState<FeedScreen>{
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadFeeds();
    
  }

  void _loadFeeds() {
    Future.microtask(() {
      ref.read(feedViewModelProvider.notifier).fetchFeeds();
    });
  }
  @override
  Widget build(BuildContext context) {
    final feedState = ref.watch(feedViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Feed'),
      ),
      body: feedState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
            
            children: [
              CreatePostField(),
              
              Expanded(child: FeedList(feeds:   feedState.feeds)),
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