import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';
import 'package:ezycourse_community/features/community/models/community_feed_model.dart';
import 'package:ezycourse_community/features/community/repositories/community_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedState {
  final bool isLoading;
  final String? errorMessage;
  final bool success;
  final FeedModel? feedData;

  FeedState({
    this.isLoading = false,
    this.errorMessage,
    this.success = false,
    this.feedData,
  });

  FeedState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? success,
    FeedModel? feedData,
    bool clearError = false,
  }) {
    return FeedState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      success: success ?? this.success,
      feedData: feedData ?? this.feedData,
    );
  }
}

class FeedViewModel extends StateNotifier<FeedState> {
  final FeedRepository _feedRepository;
  final TokenStorageService _tokenStorageService = TokenStorageService();

  FeedViewModel(this._feedRepository) : super(FeedState());

  Future<void> fetchFeeds() async {
    try {
      state = state.copyWith(isLoading: true, clearError: true);

      final token = await _tokenStorageService.getToken();

      if (token == null || token.isEmpty) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: 'No authentication token found',
        );
        return;
      }

      final result = await _feedRepository.fetchFeeds(
        communityId: 2914,
        spaceId: 5883,

        token: token,
      );

      // Print the result for debugging
      print('=== Feed Result ===');
      print('Feed ID: ${result.id}');
      print('Author: ${result.name}');
      print('Content: ${result.feedTxt}');
      print('Likes: ${result.likeCount}');
      print('Comments: ${result.commentCount}');
      print('Created At: ${result.createdAt}');
      print('Files count: ${result.files.length}');
      print('Has Poll: ${result.poll != null}');
      print('==================');

      state = state.copyWith(isLoading: false, success: true, feedData: result);
    } on NetworkException catch (e) {
      print('Network Error: ${e.message}');
      state = state.copyWith(isLoading: false, errorMessage: e.message);
    } catch (e) {
      print('Error fetching feeds: $e');
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to load feeds: ${e.toString()}',
      );
    }
  }
}

final feedViewModelProvider = StateNotifierProvider<FeedViewModel, FeedState>((
  ref,
) {
  final feedRepository = FeedRepository(
    NetworkService(baseUrl: 'https://ezyappteam.ezycourse.com/api/app/'),
  );
  return FeedViewModel(feedRepository);
});
