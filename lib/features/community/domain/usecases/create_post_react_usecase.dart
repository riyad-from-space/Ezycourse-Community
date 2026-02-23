import 'package:ezycourse_community/features/community/domain/repositories/community_repository.dart';

class CreatePostReactUseCase {
  const CreatePostReactUseCase(this.repository);

  final CommunityRepository repository;

  Future<void> call(final CreatePostReactUseCaseParams params) {
    return repository.createPostReact(
      feedId: params.feedId,
      reactType: params.reactType,
      token: params.token,
    );
  }
}

class CreatePostReactUseCaseParams {
  CreatePostReactUseCaseParams({
    required this.feedId,
    required this.reactType,
    required this.token,
  });

  final int feedId;
  final String reactType;
  final String? token;
}
