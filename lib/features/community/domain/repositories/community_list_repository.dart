import 'package:ezycourse_community/features/community/domain/entities/community_list_entity.dart';

abstract interface class CommunityListRepository{
  Future<List<CommunityListEntity>> getEnrolledCommunities({
    required final String token,
    required final int page,
    required final int limit,
  });
}