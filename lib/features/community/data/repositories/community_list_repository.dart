import 'dart:convert';

import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/features/community/data/models/community_list_model.dart';
import 'package:ezycourse_community/features/community/domain/entities/community_list_entity.dart';

class CommunityListRepository {
  final NetworkService networkService;

  CommunityListRepository(this.networkService);

  Future<List<CommunityListEntity>> getCommunityList({
    required String token,
  }) async {
    final responseData = await networkService.get(
      endpoint: '/student/community/getEnrolledCommunityList',
      token: token,
    );

    final Map<String, dynamic> body = json.decode(responseData.body);

    final List<CommunityListEntity> list = [];
    for (final d in body['data'] as Iterable) {
      list.add(CommunityListModel.fromJson(d).toEntity());
    }

    return list;
  }
}
