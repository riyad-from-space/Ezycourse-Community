import 'dart:convert';

import 'package:ezycourse_community/core/errors/app_exception.dart';
import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/features/community/data/models/feed_model.dart';
import 'package:ezycourse_community/features/community/domain/entities/feed_entity.dart';

class CommunityRepository {
  final NetworkService networkService;

  CommunityRepository(this.networkService);

  Future<List<FeedEntity>> getFeedList({
    required String token,
    required String communityUrl,
  }) async {
    final response = await networkService.get(
      token: token,
      url: communityUrl,
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as List;
      return jsonData.map((json) => FeedModel.fromJson(json).toEntity()).toList();
    } else {
      throw AppException(
        'Failed to load feeds',
        statusCode: response.statusCode,
      );
    }
  }
}
