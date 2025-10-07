import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';
import 'package:ezycourse_community/features/community/repositories/community_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedState {
  final bool isLoading;
  final String? errorMessage;

  final bool success;

  FeedState({this.isLoading = false, this.errorMessage, this.success = false});

  FeedState copyWith({
    bool? isLoading,
    String? errorMessage,

    bool? success,
    bool clearError = false,
  }) {
    return FeedState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      success: success ?? this.success,
    );
  }
}

class FeedViewModel extends StateNotifier<FeedState> {
  final FeedRepository _feedRepository;
  final TokenStorageService _tokenStorageService = TokenStorageService();

  FeedViewModel(this._feedRepository) : super(FeedState());

  Future<void> fetchFeeds() async {
    state = state.copyWith(isLoading: true);

    final token = await _tokenStorageService.getToken();
    final result = await _feedRepository.fetchFeeds(token: token ?? '');
    print(result);
    // if(result.isEmpty){
    //   state = state.copyWith(isLoading: false, errorMessage: 'No feeds available');
    //   return;
    // }else{
    //   state = state.copyWith(isLoading: false, success: true);
    // }
    state = state.copyWith(isLoading: false, success: true);
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
