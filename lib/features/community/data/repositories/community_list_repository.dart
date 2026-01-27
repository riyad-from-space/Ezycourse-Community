import 'dart:convert';

import 'package:ezycourse_community/core/config/api_endpoints.dart';
import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/features/community/data/models/community_list_model.dart';
import 'package:ezycourse_community/features/community/data/models/community_response_model.dart';
import 'package:ezycourse_community/features/community/domain/entities/community_list_entity.dart';

class CommunityListRepository {
  final NetworkService networkService;

  CommunityListRepository(this.networkService);

  Future<CommunityResponseModel> getCommunityList({
    required String token,
    required int page,
    required int limit,
  }) async {
    try {
      final communityListUrl = ApiEndpoints.communityList(page, limit);

      final response = await networkService.get(
        token: token,
        url: communityListUrl,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = json.decode(response.body);

        return CommunityResponseModel.fromJson(body);
      } else {
        throw Exception('Failed to load communities: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
