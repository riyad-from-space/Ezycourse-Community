import 'package:ezycourse_community/app/di/injection.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';
import 'package:ezycourse_community/features/community/domain/usecases/create_post_react_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePostReactState {
  final bool isLoading;
  final String? errorMessage;

  const CreatePostReactState({this.isLoading = false, this.errorMessage});

  CreatePostReactState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool clearError = false,
  }) {
    return CreatePostReactState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}

class CreatePostReactViewmodel extends StateNotifier<CreatePostReactState> {
  final CreatePostReactUseCase _useCase;
  final TokenStorageService _tokenStorageService;

  CreatePostReactViewmodel(this._useCase, this._tokenStorageService)
    : super(const CreatePostReactState());

  Future<void> createPostReact({
    required int feedId,
    required String reactType,
  }) async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final token = await _tokenStorageService.getToken();
      await _useCase.call(
        CreatePostReactUseCaseParams(
          feedId: feedId,
          reactType: reactType,
          token: token,
        ),
      );
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}

final createPostReactViewmodelProvider =
    StateNotifierProvider<CreatePostReactViewmodel, CreatePostReactState>((
      ref,
    ) {
      return CreatePostReactViewmodel(
        serviceLocator<CreatePostReactUseCase>(),
        serviceLocator<TokenStorageService>(),
      );
    });
