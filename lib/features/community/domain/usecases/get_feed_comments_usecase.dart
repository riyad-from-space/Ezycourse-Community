import 'package:ezycourse_community/features/community/domain/entities/feed_comment_entity.dart';
import 'package:ezycourse_community/features/community/domain/repositories/community_repository.dart';

class GetFeedCommentsUseCase {
  const GetFeedCommentsUseCase(this.repository);

  final CommunityRepository repository;

  Future<List<FeedCommentEntity>> call(
    final GetFeedCommentsUseCaseParams params,
  ) {
    return repository.getFeedComments(
      token: params.token,
      feedId: params.feedId,
    );
  }
}

class GetFeedCommentsUseCaseParams {
  GetFeedCommentsUseCaseParams({
    required this.token,
    required this.feedId,
  });

  final String token;
  final int feedId;
}
