import 'package:ezycourse_community/features/community/domain/entities/feed_entity.dart';
import 'package:ezycourse_community/features/community/domain/repositories/community_repository.dart';

class GetCommunityFeedsUseCase {
  const GetCommunityFeedsUseCase(this.repository);

  final CommunityRepository repository;

  Future<List<FeedEntity>> call(
    final GetCommunityFeedsUseCaseParams params,
  ) {
    return repository.getCommunityFeeds(
      token: params.token,
      communityId: params.communityId,
      spaceId: params.spaceId,
    );
  }
}

class GetCommunityFeedsUseCaseParams {
  GetCommunityFeedsUseCaseParams({
    required this.token,
    required this.communityId,
    required this.spaceId,
  });

  final String token;
  final int communityId;
  final int spaceId;
}
