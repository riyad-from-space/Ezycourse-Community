import 'package:ezycourse_community/features/community/domain/repositories/community_repository.dart';

class CreatePostUseCase {
  const CreatePostUseCase(this.repository);

  final CommunityRepository repository;

  Future<void> call(final CreatePostUseCaseParams params) {
    return repository.createPost(
      postText: params.postText,
      token: params.token,
      spaceId: params.spaceId,
      communityId: params.communityId,
      files: params.files,
    );
  }
}

class CreatePostUseCaseParams {
  CreatePostUseCaseParams({
    required this.postText,
    required this.token,
    required this.spaceId,
    required this.communityId,
    this.files,
  });

  final String postText;
  final String? token;
  final int spaceId;
  final int communityId;
  final List<Map<String, dynamic>>? files;
}
