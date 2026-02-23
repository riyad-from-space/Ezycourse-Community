import 'package:ezycourse_community/app/di/injection.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';
import 'package:ezycourse_community/features/community/domain/entities/feed_comment_entity.dart';
import 'package:ezycourse_community/features/community/domain/usecases/get_feed_comments_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedCommentState {
  final bool isLoading;
  final String? errorMessage;
  final List<FeedCommentEntity> comments;

  const FeedCommentState({
    this.isLoading = false,
    this.errorMessage,
    this.comments = const [],
  });

  FeedCommentState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<FeedCommentEntity>? comments,
    bool clearError = false,
  }) {
    return FeedCommentState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      comments: comments ?? this.comments,
    );
  }
}

class FeedCommentViewmodel extends StateNotifier<FeedCommentState> {
  final TokenStorageService _tokenStorageService;
  final GetFeedCommentsUseCase _useCase;

  FeedCommentViewmodel(this._useCase, this._tokenStorageService)
      : super(const FeedCommentState());

  Future<void> fetchFeedComments({required int feedId}) async {
    try {
      if (state.isLoading) return;
      final token = await _tokenStorageService.getToken();
      if (token == null) {
        state = state.copyWith(errorMessage: "User not authenticated");
        return;
      }
      state = state.copyWith(isLoading: true, errorMessage: null);

      final comments = await _useCase.call(
        GetFeedCommentsUseCaseParams(
          token: token,
          feedId: feedId,
        ),
      );

      state = state.copyWith(isLoading: false, comments: comments);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}

final feedCommentViewmodelProvider =
    StateNotifierProvider<FeedCommentViewmodel, FeedCommentState>((ref) {
  return FeedCommentViewmodel(
    serviceLocator<GetFeedCommentsUseCase>(),
    serviceLocator<TokenStorageService>(),
  );
});
