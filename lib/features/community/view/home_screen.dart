import 'package:ezycourse_community/features/auth/view/screens/login_screen.dart';
import 'package:ezycourse_community/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:ezycourse_community/features/community/viewmodel/community_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch posts on load
    Future.microtask(
      () => ref.read(communityViewModelProvider.notifier).fetchPosts(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final communityState = ref.watch(communityViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Posts'),
        backgroundColor: const Color(0xff115C67),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              ref.read(authViewModelProvider.notifier).logout();
              if (context.mounted) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                  (route) => false,
                );
              }
            },
          ),
        ],
      ),
      body: communityState.isLoading && communityState.posts.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : communityState.hasError && communityState.posts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(communityState.errorMessage ?? 'Error loading posts'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => ref
                        .read(communityViewModelProvider.notifier)
                        .fetchPosts(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            )
          : communityState.posts.isEmpty
          ? const Center(child: Text('No posts'))
          : ListView.builder(
              itemCount: communityState.posts.length,
              itemBuilder: (context, index) {
                final post = communityState.posts[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(post.user.profilePic),
                  ),
                  title: Text(post.title),
                  subtitle: Text(post.feedText),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('❤️ ${post.likeCount}'),
                      Text('💬 ${post.commentCount}'),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
