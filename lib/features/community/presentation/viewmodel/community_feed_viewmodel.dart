import 'package:ezycourse_community/core/config/api_endpoints.dart';
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

  FeedViewModel(this._repository) : super(const FeedState());

  void resetFeed() {
    state = const FeedState();
  }

  Future<void> fetchFeeds(int communityId, int spaceId) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final token = await _tokenStorageService.getToken();

      if (token == null || token.isEmpty) {
        throw Exception('No authentication token found');
      }

      print(communityId);
      print(spaceId);
      final communityUrl = ApiEndpoints.communityFeed(communityId, spaceId);

      final newFeeds = await _repository.getFeedList(
        token: token,
        communityUrl: communityUrl,
      );

      // Update state with new feeds
      state = state.copyWith(isLoading: false, feeds: newFeeds);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}

/// Provider for FeedViewModel - AutoDispose to clear state when screen is disposed
final feedViewModelProvider = StateNotifierProvider.autoDispose<FeedViewModel, FeedState>((
  ref,
) {
  return FeedViewModel(CommunityRepository(NetworkService()));
});
