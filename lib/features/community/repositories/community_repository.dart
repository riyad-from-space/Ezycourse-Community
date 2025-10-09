import 'dart:convert';

import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/features/community/models/community_feed_model.dart';

class FeedRepository {
  final NetworkService networkService;

  FeedRepository(this.networkService);

  Future<FeedModel> fetchFeeds({required String token}) async {
    final response = await networkService.post(
      'teacher/community/getFeed?status=feed&',
      token: token,
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return await FeedModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load feeds');
    }
  }
}
