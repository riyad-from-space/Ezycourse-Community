import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/features/community/data/models/feed_model.dart';
import 'package:ezycourse_community/features/community/domain/entities/feed_entity.dart';

class CommunityRepository {
  final NetworkService networkService;
  CommunityRepository(this.networkService);

  Future<List<FeedEntity>> getFeedList({
    required String token,
    int communityId = 2914,
    int spaceId = 5883,
  }) async {
    final body = {'space_id': spaceId, 'community_id': communityId};
    try {
      final response = await networkService.post(
        'teacher/community/getFeed?status=feed&',
        
        token: token,
        body: body,
      );

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


// import 'dart:convert';
// import 'package:ezycourse_community/core/services/network_service.dart';
// import 'package:ezycourse_community/features/community/data/models/feed_model.dart';
// import 'package:ezycourse_community/features/community/domain/entities/feed_entity.dart';


// class CommunityRepository {
//   final NetworkService networkService;


//   CommunityRepository(this.networkService);

//   /// Fetch feed list from API
//   /// Returns a list of FeedEntity (domain objects)
//   Future<List<FeedEntity>> getFeedList({

//     required String token,
//     int communityId = 2914, 
//     int spaceId = 5883, 
//   }) async {
//     try {
//       // Make POST request as per API documentation
//       final response = await networkService.post(
//         'teacher/community/getFeed?status=feed&',
//         token: token,
//         body: {
//           'community_id': communityId,
//           'space_id': spaceId, 
//         },
//       );

//       if (response.statusCode == 200) {
//         final jsonData = jsonDecode(response.body) as List;
        
//         // Handle if response is an array
//         return jsonData
//             .map((json) => FeedModel.fromJson(json).toEntity())
//             .toList();
              
      
//       } else {
//         throw Exception('Failed to load feeds: ${response.statusCode}');
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }


// }