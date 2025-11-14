import 'package:ezycourse_community/core/services/token_storage_service.dart';
import 'package:ezycourse_community/features/auth/view/screens/login_screen.dart';
import 'package:ezycourse_community/features/community/domain/entities/feed_entity.dart';
import 'package:ezycourse_community/features/community/viewmodel/community_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController _postController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Fetch feeds when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(feedViewModelProvider.notifier).fetchFeeds();
    });

    // Listen for scroll to load more
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      // Load more when 90% scrolled
      ref.read(feedViewModelProvider.notifier).loadMoreFeeds();
    }
  }

  void _addPost() async {
    if (_postController.text.trim().isEmpty) return;

    await ref.read(feedViewModelProvider.notifier).createPost(
          text: _postController.text.trim(),
        );

    _postController.clear();

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Post created successfully!')),
      );
    }
  }

  void _onBottomNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                TokenStorageService().deleteToken();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final feedState = ref.watch(feedViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D5F5D),
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Python Developer Community',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '#General',
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
      ),
      drawer: _buildDrawer(),
      body: RefreshIndicator(
        onRefresh: () =>
            ref.read(feedViewModelProvider.notifier).refreshFeeds(),
        child: feedState.isLoading && feedState.feeds.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : feedState.errorMessage != null && feedState.feeds.isEmpty
                ? _buildErrorState(feedState.errorMessage!)
                : _buildFeedList(feedState),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onBottomNavTap,
        selectedItemColor: const Color(0xFF2D5F5D),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF2D5F5D)),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Color(0xFF1D4F4D),
              child: Icon(Icons.person, color: Colors.white, size: 40),
            ),
            accountName: Text(
              'John Doe',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text('john@example.com'),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Communities'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => Navigator.pop(context),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 60, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            'Error loading feeds',
            style: TextStyle(fontSize: 18, color: Colors.grey[700]),
          ),
          const SizedBox(height: 8),
          Text(
            error,
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () =>
                ref.read(feedViewModelProvider.notifier).refreshFeeds(),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildFeedList(FeedState feedState) {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      itemCount: feedState.feeds.length + 2, // +2 for input card and loader
      itemBuilder: (context, index) {
        // Post input card at top
        if (index == 0) {
          return Column(
            children: [
              _buildPostInputCard(),
              const SizedBox(height: 16),
            ],
          );
        }

        // Show loading indicator at bottom when loading more
        if (index == feedState.feeds.length + 1) {
          return feedState.isLoading
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(),
                  ),
                )
              : const SizedBox.shrink();
        }

        // Feed items
        final feed = feedState.feeds[index - 1];
        return _buildFeedCard(feed);
      },
    );
  }

  Widget _buildPostInputCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person, color: Colors.grey[600]),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: _postController,
              decoration: const InputDecoration(
                hintText: 'Write Something here...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
              onSubmitted: (_) => _addPost(),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: _addPost,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2D5F5D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: const Text('Post'),
          ),
        ],
      ),
    );
  }

  Widget _buildFeedCard(FeedEntity feed) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with author info
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(feed.author.profilePic),
                  backgroundColor: Colors.grey[300],
                  child: feed.author.profilePic.isEmpty
                      ? Text(
                          feed.author.initials,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        feed.author.fullName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        feed.relativeTime,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                if (feed.isPinned)
                  const Icon(Icons.push_pin, size: 18, color: Colors.grey),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.more_vert, color: Colors.grey),
                  onPressed: () => _showPostOptions(feed),
                ),
              ],
            ),
          ),

          // Content with background color
          if (feed.hasBackground && feed.background != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: _parseGradient(feed.background!.backgroundImage),
              ),
              child: Text(
                feed.feedText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          else ...[
            // Regular text content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                feed.feedText,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
            ),
            // Images
            if (feed.hasImages) ...[
              const SizedBox(height: 12),
              ...feed.files.map((file) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Image.network(
                      file.fileLoc,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 200,
                          color: Colors.grey[300],
                          child: const Center(
                            child:
                                Icon(Icons.image, size: 50, color: Colors.grey),
                          ),
                        );
                      },
                    ),
                  )),
            ],
          ],

          // Engagement section
          _buildEngagementSection(feed),
        ],
      ),
    );
  }

  Widget _buildEngagementSection(FeedEntity feed) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Engagement counts
          Row(
            children: [
              if (feed.likeCount > 0) ...[
                const Icon(Icons.thumb_up, size: 16, color: Colors.blue),
                const SizedBox(width: 4),
                Text(
                  '${feed.likeCount}',
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
              const Spacer(),
              if (feed.commentCount > 0)
                Text(
                  '${feed.commentCount} Comments',
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 12),
          // Action buttons
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => ref
                      .read(feedViewModelProvider.notifier)
                      .toggleLike(feed.id),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        feed.isLikedByUser
                            ? Icons.thumb_up
                            : Icons.thumb_up_outlined,
                        color:
                            feed.isLikedByUser ? Colors.blue : Colors.grey,
                        size: 20,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Like',
                        style: TextStyle(
                          color: feed.isLikedByUser ? Colors.blue : Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Comment feature coming soon!'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.chat_bubble_outline,
                        color: Colors.grey,
                        size: 20,
                      ),
                      SizedBox(width: 6),
                      Text(
                        'Comment',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showPostOptions(FeedEntity feed) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (feed.isFeedEdit)
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Edit'),
                onTap: () => Navigator.pop(context),
              ),
            if (feed.isFeedEdit)
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Delete'),
                onTap: () => Navigator.pop(context),
              ),
            ListTile(
              leading: const Icon(Icons.report),
              title: const Text('Report'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  LinearGradient _parseGradient(String gradientString) {
    // Simple gradient parser - you might need to enhance this
    // For now, return a default gradient
    return const LinearGradient(
      colors: [Color(0xFF2D5F5D), Color(0xFF1D4F4D)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  @override
  void dispose() {
    _postController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
