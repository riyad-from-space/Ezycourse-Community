import 'package:ezycourse_community/app/di/injection.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';
import 'package:ezycourse_community/features/community/domain/entities/feed_entity.dart';
import 'package:ezycourse_community/features/community/domain/entities/feed_like_entity.dart';
import 'package:ezycourse_community/features/community/domain/usecases/get_community_feeds_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// State for feed list
class FeedState {
  final bool isLoading;
  final String? errorMessage;
  final List<FeedEntity> feeds;
  final bool hasFetched;

  const FeedState({
    this.isLoading = false,
    this.errorMessage,
    this.feeds = const [],
    this.hasFetched = false,
  });

  FeedState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<FeedEntity>? feeds,
    bool? hasFetched,
    bool clearError = false,
  }) {
    return FeedState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      feeds: feeds ?? this.feeds,
      hasFetched: hasFetched ?? this.hasFetched,
    );
  }
}

/// ViewModel for managing feed list state
class FeedViewModel extends StateNotifier<FeedState> {
  final GetCommunityFeedsUseCase _useCase;
  final TokenStorageService _tokenStorageService;

  FeedViewModel(this._useCase, this._tokenStorageService)
      : super(const FeedState());

  void resetFeed() {
    state = const FeedState();
  }

  /// Optimistically update a feed's reaction locally for instant UI feedback
  void updateReaction(int feedId, String reactionType) {
    final updatedFeeds = state.feeds.map((feed) {
      if (feed.id == feedId) {
        final hadReaction = feed.like?.reactionType != null;
        final isSameReaction = feed.like?.reactionType == reactionType;

        return feed.copyWith(
          like: isSameReaction
              ? null
              : FeedLikeEntity(reactionType: reactionType),
          likeCount: isSameReaction
              ? feed.likeCount - 1
              : hadReaction
                  ? feed.likeCount
                  : feed.likeCount + 1,
        );
      }
      return feed;
    }).toList();

    state = state.copyWith(feeds: updatedFeeds);
  }

  Future<void> fetchFeeds(int communityId, int spaceId) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final token = await _tokenStorageService.getToken();

      if (token == null || token.isEmpty) {
        throw Exception('No authentication token found');
      }

      final newFeeds = await _useCase.call(
        GetCommunityFeedsUseCaseParams(
          token: token,
          communityId: communityId,
          spaceId: spaceId,
        ),
      );

      state = state.copyWith(
        isLoading: false,
        feeds: newFeeds,
        hasFetched: true,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
        hasFetched: true,
      );
    }
  }
}

/// Provider for FeedViewModel - AutoDispose to clear state when screen is disposed
final feedViewModelProvider =
    StateNotifierProvider.autoDispose<FeedViewModel, FeedState>((ref) {
      return FeedViewModel(
        serviceLocator<GetCommunityFeedsUseCase>(),
        serviceLocator<TokenStorageService>(),
      );
    });
