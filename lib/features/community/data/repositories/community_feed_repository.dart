import 'dart:convert';

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
    
    try {
      final response = await networkService.get(token: token, url: communityUrl);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as List;
        List<FeedEntity> tempList = [];
        for (var x in jsonData) {
          final FeedModel model = FeedModel.fromJson(x);
          final FeedEntity entity = model.toEntity();
          tempList.add(entity);
        }
        return tempList;

        // return jsonData.map((json)=>FeedModel.fromJson(json).toEntity()).toList();
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }
}
