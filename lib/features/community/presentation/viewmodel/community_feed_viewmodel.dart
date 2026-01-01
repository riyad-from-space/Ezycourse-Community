import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';
import 'package:ezycourse_community/features/community/data/repositories/community_feed_repository.dart';
import 'package:ezycourse_community/features/community/domain/entities/feed_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// State for feed list
class FeedState {
  final bool isLoading;
  final String? errorMessage;
  final List<FeedEntity> feeds;

  const FeedState({
    this.isLoading = false,
    this.errorMessage,
    this.feeds = const [],
  });

  FeedState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<FeedEntity>? feeds,
    bool clearError = false,
  }) {
    return FeedState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      feeds: feeds ?? this.feeds,
    );
  }
}

/// ViewModel for managing feed list state
class FeedViewModel extends StateNotifier<FeedState> {
  final CommunityRepository _repository;
  final TokenStorageService _tokenStorageService = TokenStorageService();

  FeedViewModel(this._repository)
      : super(const FeedState());

  /// Fetch feeds from API
  Future<void> fetchFeeds() async {
    // Don't fetch if already loading
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final token = await _tokenStorageService.getToken();

      if (token == null || token.isEmpty) {
        throw Exception('No authentication token found');
      }

      final newFeeds = await _repository.getFeedList(token: token);

      // Update state with new feeds
      state = state.copyWith(
        isLoading: false,
        feeds: newFeeds,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
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

  return FeedViewModel(repository);
});