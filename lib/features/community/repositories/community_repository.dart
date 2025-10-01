import 'dart:convert';

import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/features/community/models/community_post_model.dart';

class CommunityRepository {
  final NetworkService _networkService;

  CommunityRepository(this._networkService);

  Future<List<CommunityPostModel>> fetchPosts({
    required String token,
    required int communityId,
    required int spaceId,
  }) async {
    final header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final endpoint = 'teacher/community/getFeed?status=feed&';
    final response = await _networkService.post(
      endpoint,
      headers: header,
      body: {'community_id': communityId, 'space_id': spaceId},
    );
    print('Posts Response status: ${response.statusCode}');
    print('Posts Response body: ${response.body}');

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as List;
      return jsonData
          .map((postJson) => CommunityPostModel.fromJson(postJson))
          .toList();
    } else if (response.statusCode == 401) {
      throw NetworkException('Unauthorized access', 401);
    } else if (response.statusCode >= 500) {
      throw NetworkException(
        'Server error. Please try again later',
        response.statusCode,
      );
    } else {
      final error = jsonDecode(response.body);
      final message = error['message'] ?? 'Failed to fetch posts';
      throw NetworkException(message, response.statusCode);
    }
  }
}
