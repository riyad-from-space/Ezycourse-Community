import 'package:ezycourse_community/features/community/domain/entities/feed_entity.dart';
import 'package:ezycourse_community/features/community/viewmodel/community_viewmodel.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';
import 'package:ezycourse_community/features/auth/view/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedScreen extends ConsumerStatefulWidget {
  const FeedScreen({super.key});

  @override
  ConsumerState<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends ConsumerState<FeedScreen> {
  final TokenStorageService _tokenStorage = TokenStorageService();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Fetch feeds when screen loads
    Future.microtask(() => ref.read(feedViewModelProvider.notifier).fetchFeeds());
  }

  @override
  Widget build(BuildContext context) {
    final feedState = ref.watch(feedViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Feed'),
        backgroundColor: Colors.purple,
      ),
      body: _buildBody(feedState),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) async {
          if (index == 0) {
            setState(() => _currentIndex = 0);
            // Ensure feeds are visible
            ref.read(feedViewModelProvider.notifier).fetchFeeds();
            return;
          }

          // Logout tapped - confirm
          final confirmed = await showDialog<bool>(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('Logout'),
              content: const Text('Are you sure you want to logout?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(true),
                  child: const Text('Logout'),
                ),
              ],
            ),
          );

          if (confirmed == true) {
            await _handleLogout();
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Community'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Logout'),
        ],
      ),
    );
  }

  Widget _buildBody(FeedState feedState) {
    // Show loading indicator
    if (feedState.isLoading && feedState.feeds.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    // Show error message
    if (feedState.errorMessage != null && feedState.feeds.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 60, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Error: ${feedState.errorMessage}',
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    // Show empty state
    if (feedState.feeds.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.feed_outlined, size: 60, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No posts yet',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    // Show feed list
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: feedState.feeds.length,
      itemBuilder: (context, index) {
        final feed = feedState.feeds[index];
        return _buildPostCard(feed);
      },
    );
  }

  Widget _buildPostCard(FeedEntity feed) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Author header
            _buildAuthorHeader(feed),
            const SizedBox(height: 12),

            // Post content
            if (feed.feedText.isNotEmpty)
              Text(
                feed.feedText,
                style: const TextStyle(fontSize: 15, height: 1.4),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAuthorHeader(FeedEntity feed) {
    return Row(
      children: [
        // Profile picture
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.purple,
          backgroundImage: feed.userPic.isNotEmpty ? NetworkImage(feed.userPic) : null,
          child: feed.userPic.isEmpty
              ? Text(
                  _getInitials(feed.userName),
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                )
              : null,
        ),
        const SizedBox(width: 12),

        // Author name and time
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                feed.userName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                _formatTime(feed.createdAt),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  String _getInitials(String name) {
    final parts = name.trim().split(' ').where((p) => p.isNotEmpty).toList();
    if (parts.isEmpty) return 'U';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[parts.length - 1][0]}'.toUpperCase();
  }

  String _formatTime(DateTime createdAt) {
    final now = DateTime.now();
    final diff = now.difference(createdAt);
    if (diff.inDays >= 365) return '${(diff.inDays / 365).floor()}y ago';
    if (diff.inDays >= 30) return '${(diff.inDays / 30).floor()}mo ago';
    if (diff.inDays > 0) return '${diff.inDays}d ago';
    if (diff.inHours > 0) return '${diff.inHours}h ago';
    if (diff.inMinutes > 0) return '${diff.inMinutes}m ago';
    return 'Just now';
  }

  Future<void> _handleLogout() async {
    try {
      await _tokenStorage.deleteToken();
    } catch (_) {
      // ignore storage errors
    }

    if (mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
        (route) => false,
      );
    }
  }
}
