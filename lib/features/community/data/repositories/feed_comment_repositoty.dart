import 'dart:convert';

import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/features/community/data/models/feed_comment_model.dart';
import 'package:ezycourse_community/features/community/domain/entities/feed_comment_entity.dart';

class FeedCommentRepository {
  final NetworkService networkService;
  FeedCommentRepository(this.networkService);

  Future<List<FeedCommentEntity>> fetchFeedComments({
    required String url,
    required String token,
   
  }) async {
    try {
      final response = await networkService.get(url: url, token: token);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as List;

        List<FeedCommentEntity> tempList = [];
        for (var x in jsonData) {
          final FeedCommentModel model = FeedCommentModel.fromJson(x);
          tempList.add(model.toEntity());
        }
        return tempList;
        
      } else {
        throw [];
      }
    } catch (e) {
      rethrow;
    }
    
  }
}