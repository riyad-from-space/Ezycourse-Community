import 'package:ezycourse_community/app/di/injection.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';
import 'package:ezycourse_community/features/community/domain/usecases/create_post_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePostState {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  const CreatePostState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  CreatePostState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    bool clearError = false,
  }) {
    return CreatePostState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}

class CreatePostViewmodel extends StateNotifier<CreatePostState> {
  final CreatePostUseCase _useCase;
  final TokenStorageService _tokenStorageService;

  CreatePostViewmodel(this._useCase, this._tokenStorageService)
      : super(const CreatePostState());

  Future<void> createPost({
    required String postText,
    required int spaceId,
    required int communityId,
    List<Map<String, dynamic>>? files,
  }) async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final token = await _tokenStorageService.getToken();
      await _useCase.call(
        CreatePostUseCaseParams(
          postText: postText,
          token: token,
          spaceId: spaceId,
          communityId: communityId,
          files: files,
        ),
      );
      state = state.copyWith(isLoading: false, isSuccess: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
      rethrow;
    }
  }
}

final createPostViewmodelProvider =
    StateNotifierProvider<CreatePostViewmodel, CreatePostState>((ref) {
      return CreatePostViewmodel(
        serviceLocator<CreatePostUseCase>(),
        serviceLocator<TokenStorageService>(),
      );
    });
