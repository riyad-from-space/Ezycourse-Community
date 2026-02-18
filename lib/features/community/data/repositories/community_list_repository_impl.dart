import 'package:ezycourse_community/core/constants/api.dart';
import 'package:ezycourse_community/features/community/data/datasources/community_remote_datasource.dart';
import 'package:ezycourse_community/features/community/data/models/community_list_response_model.dart';
import 'package:ezycourse_community/features/community/domain/entities/community_list_entity.dart';
import 'package:ezycourse_community/features/community/domain/repositories/community_list_repository.dart';

class CommunityListRepositoryImpl implements CommunityListRepository {
  final CommunitRemoteDatasource remoteDatasource;
  CommunityListRepositoryImpl(this.remoteDatasource);

  @override
  Future<List<CommunityListEntity>> getEnrolledCommunities({
    required String token,
    required int page,
    required int limit,
  }) async {
    try {
      final url = ApiEndpoints.communityList(page, limit);
      final CommunityListResponseModel response = await remoteDatasource.getEnrolledCommunities(
        token: token,
        url: url,
      );

      // Convert all communities from the response data
      return response.data.map((e) => e.toEntity()).toList();
    } catch (e) {
      rethrow;
    }
  }
}
