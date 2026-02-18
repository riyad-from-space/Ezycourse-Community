import 'package:ezycourse_community/features/community/domain/entities/community_list_entity.dart';
import 'package:ezycourse_community/features/community/domain/repositories/community_list_repository.dart';


class GetEnrolledCommunityUseCase {
  const GetEnrolledCommunityUseCase(this.repository);

  final CommunityListRepository repository;

  Future<List<CommunityListEntity>> call(
    final GetEnrolledCommunityUseCaseParam params,
  ) {
    return repository.getEnrolledCommunities(
      token: params.token,
      page: params.page,
      limit: params.limit,
    );
  }
}

class GetEnrolledCommunityUseCaseParam {
  GetEnrolledCommunityUseCaseParam({
    required this.token,
    required this.page,
    required this.limit,
  });

  final String token;

  final int page;

  final int limit;
}
