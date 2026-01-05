import 'package:ezycourse_community/core/config/api_endpoints.dart';
import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';
import 'package:ezycourse_community/features/community/data/repositories/create_post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePostState {
  final bool isLoading;
  final String? errorMessage;

  const CreatePostState({this.isLoading = false, this.errorMessage});

  CreatePostState copyWith({
    bool? isLoading,
    String? errorMessage,

    bool clearError = false,
  }) {
    return CreatePostState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}

class CreatePostViewmodel extends StateNotifier<CreatePostState> {
  final CreatePostRepository createPostRepository;
  final TokenStorageService tokenStorageService = TokenStorageService();
  CreatePostViewmodel(this.createPostRepository) : super(CreatePostState());

  Future<void> createPost({required String postText}) async {
    if (state.isLoading) return;
    final token = await tokenStorageService.getToken();
    await createPostRepository.createPost(postText: postText, token: token);
    state = state.copyWith(isLoading: false);
  }


}
  final createPostViewmodelProvider =
      StateNotifierProvider<CreatePostViewmodel, CreatePostState>((ref) {
        

        return CreatePostViewmodel(CreatePostRepository(NetworkService()));
      });
