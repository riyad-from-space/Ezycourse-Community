import 'package:ezycourse_community/app/di/injection.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';
import 'package:ezycourse_community/features/community/domain/usecases/create_feed_comment_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateFeedCommentState {
  final bool isLoading;
  final String? errorMessage;

  const CreateFeedCommentState({this.isLoading = false, this.errorMessage});

  CreateFeedCommentState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool clearError = false,
  }) {
    return CreateFeedCommentState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}

class CreateFeedCommentViewmodel
    extends StateNotifier<CreateFeedCommentState> {
  final CreateFeedCommentUseCase _useCase;
  final TokenStorageService _tokenStorageService;

  CreateFeedCommentViewmodel(this._useCase, this._tokenStorageService)
      : super(const CreateFeedCommentState());

  Future<void> createFeedComment({
    required String commentText,
    required int feedId,
  }) async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final token = await _tokenStorageService.getToken();
      await _useCase.call(
        CreateFeedCommentUseCaseParams(
          commentText: commentText,
          token: token,
          feedId: feedId,
        ),
      );
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}

final createFeedCommentViewmodelProvider =
    StateNotifierProvider<CreateFeedCommentViewmodel, CreateFeedCommentState>(
        (ref) {
  return CreateFeedCommentViewmodel(
    serviceLocator<CreateFeedCommentUseCase>(),
    serviceLocator<TokenStorageService>(),
  );
});
