import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';
import 'package:ezycourse_community/features/community/data/repositories/create_post_react_repository.dart';
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
  final CreatePostReactRepository createPostReactRepository;
  final TokenStorageService tokenStorageService = TokenStorageService();
  CreatePostReactViewmodel(this.createPostReactRepository)
    : super(const CreatePostReactState());
  Future<void> createPostReact({
    required int feedId,
    required String reactType,
  }) async {
    if (state.isLoading) return;

    final token = await tokenStorageService.getToken();
    await createPostReactRepository.createPostReact(
      feedId: feedId,
      reactType: reactType,
      token: token,
    );

    print("Feed ID: $feedId, React Type: $reactType");

    state = state.copyWith(isLoading: false);
  }
}

final CreatePostReactViewmodelProvider =
    StateNotifierProvider<CreatePostReactViewmodel, CreatePostReactState>((
      ref,
    ) {
      return CreatePostReactViewmodel(
        CreatePostReactRepository(NetworkService()),
      );
    });
