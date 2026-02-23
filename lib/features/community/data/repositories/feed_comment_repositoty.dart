import 'dart:convert';

import 'package:ezycourse_community/core/errors/app_exception.dart';
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
    final response = await networkService.get(url: url, token: token);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as List;
      return jsonData
          .map((x) => FeedCommentModel.fromJson(x).toEntity())
          .toList();
    } else {
      throw AppException(
        'Failed to load comments',
        statusCode: response.statusCode,
      );
    }
  }
}
