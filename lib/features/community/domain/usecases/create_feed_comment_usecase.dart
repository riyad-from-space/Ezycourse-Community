import 'package:ezycourse_community/features/community/domain/repositories/community_repository.dart';

class CreateFeedCommentUseCase {
  const CreateFeedCommentUseCase(this.repository);

  final CommunityRepository repository;

  Future<void> call(final CreateFeedCommentUseCaseParams params) {
    return repository.createFeedComment(
      commentText: params.commentText,
      token: params.token,
      feedId: params.feedId,
    );
  }
}

class CreateFeedCommentUseCaseParams {
  CreateFeedCommentUseCaseParams({
    required this.commentText,
    required this.token,
    required this.feedId,
  });

  final String commentText;
  final String? token;
  final int feedId;
}
