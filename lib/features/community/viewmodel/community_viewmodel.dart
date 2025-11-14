import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';
import 'package:ezycourse_community/features/community/data/repositories/community_repository.dart';
import 'package:ezycourse_community/features/community/domain/entities/feed_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// State for feed list
class FeedState {
  final bool isLoading;
  final String? errorMessage;
  final List<FeedEntity> feeds; // Changed to List<FeedEntity>
  final bool hasMore;

  FeedState({
    this.isLoading = false,
    this.errorMessage,
    this.feeds = const [],
    this.hasMore = true,
  });

  FeedState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<FeedEntity>? feeds,
    bool? hasMore,
    bool clearError = false,
  }) {
    return FeedState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      feeds: feeds ?? this.feeds,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}

/// ViewModel for managing feed list state
class FeedViewModel extends StateNotifier<FeedState> {
  final CommunityRepository _repository;
  final TokenStorageService _tokenStorageService;

  FeedViewModel(this._repository, this._tokenStorageService)
      : super(FeedState());

  /// Fetch feeds from API
  Future<void> fetchFeeds({bool refresh = false}) async {
    // Don't fetch if already loading
    if (state.isLoading) return;

    // Reset page if refreshing
    if (refresh) {
    }

    // Don't fetch more if no more data
    if (!refresh && !state.hasMore) return;

    state = state.copyWith(
      isLoading: true,
      clearError: true,
      feeds: refresh ? [] : null, // Clear feeds if refreshing
    );

    try {
      final token = await _tokenStorageService.getToken();

      if (token == null || token.isEmpty) {
        throw Exception('No authentication token found');
      }

      final newFeeds = await _repository.getFeedList(
        token: token,

      );

      // Update state with new feeds
      state = state.copyWith(
        isLoading: false,
        feeds: refresh ? newFeeds : [...state.feeds, ...newFeeds],
        hasMore: newFeeds.length >= 20, // Has more if we got a full page
      );

    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  /// Refresh feeds (pull to refresh)
  Future<void> refreshFeeds() async {
    await fetchFeeds(refresh: true);
  }

  /// Load more feeds (pagination)
  Future<void> loadMoreFeeds() async {
    await fetchFeeds(refresh: false);
  }

  /// Toggle like on a feed
  Future<void> toggleLike(int feedId) async {
    try {
      final token = await _tokenStorageService.getToken();
      if (token == null) return;

      await _repository.toggleLike(token: token, feedId: feedId);

      // Update local state optimistically
      final updatedFeeds = state.feeds.map((feed) {
        if (feed.id == feedId) {
          // Toggle like state
          final isLiked = !feed.isLikedByUser;
          final newLikeCount = isLiked ? feed.likeCount + 1 : feed.likeCount - 1;

          // Note: This is a simplified update. You might need to create
          // a copyWith method in FeedEntity for proper immutability
          return feed; // For now, just return the same feed
        }
        return feed;
      }).toList();

      state = state.copyWith(feeds: updatedFeeds);

      // Optionally refresh to get server state
      await refreshFeeds();
    } catch (e) {
      state = state.copyWith(errorMessage: 'Failed to toggle like: $e');
    }
  }

  /// Create a new feed post
  Future<void> createPost({
    required String text,
    List<String>? fileUrls,
    String? backgroundColor,
  }) async {
    try {
      final token = await _tokenStorageService.getToken();
      if (token == null) throw Exception('No authentication token');

      final newFeed = await _repository.createFeed(
        token: token,
        communityId: 2914, // Your community ID
        text: text,
        fileUrls: fileUrls,
        backgroundColor: backgroundColor,
      );

      // Add new feed to the top of the list
      state = state.copyWith(
        feeds: [newFeed, ...state.feeds],
      );
    } catch (e) {
      state = state.copyWith(errorMessage: 'Failed to create post: $e');
    }
  }
}

/// Provider for FeedViewModel
final feedViewModelProvider =
    StateNotifierProvider<FeedViewModel, FeedState>((ref) {
  final networkService = NetworkService(
    baseUrl: 'https://ezyappteam.ezycourse.com/api/app/',
  );
  final repository = CommunityRepository(networkService);
  final tokenService = TokenStorageService();

  return FeedViewModel(repository, tokenService);
});
