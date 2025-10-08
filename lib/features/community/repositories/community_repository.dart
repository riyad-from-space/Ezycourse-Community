import 'dart:convert';

import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/features/community/models/community_feed_model.dart';

class FeedRepository {
  final NetworkService networkService;

  FeedRepository(this.networkService);

  Future<List<FeedModel>> fetchFeeds({
    required String token,
    int? communityId,
    int? spaceId,
  }) async {
    final response = await networkService.post(
      'teacher/community/getFeed?status=feed&',
      token: token,
      body: {'community_id': communityId, 'space_id': spaceId},
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      List<FeedModel> feed = (response as List<dynamic>)
          .map((e) => FeedModel.fromJson(e))
          .toList();
      print('Parsed Feeds: ${feed.length}');
      return feed;
    } else {
      throw Exception('Failed to load feeds');
    }
  }
}
