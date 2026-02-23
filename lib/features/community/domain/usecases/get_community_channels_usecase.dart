import 'package:ezycourse_community/features/community/domain/entities/community_channel_entity.dart';
import 'package:ezycourse_community/features/community/domain/repositories/community_repository.dart';

class GetCommunityChannelsUseCase {
  const GetCommunityChannelsUseCase(this.repository);

  final CommunityRepository repository;

  Future<List<CommunityChannelEntity>> call(
    final GetCommunityChannelsUseCaseParams params,
  ) {
    return repository.getCommunityChannels(
      token: params.token,
      communityId: params.communityId,
    );
  }
}

class GetCommunityChannelsUseCaseParams {
  GetCommunityChannelsUseCaseParams({
    required this.token,
    required this.communityId,
  });

  final String token;
  final int communityId;
}
