import 'package:ezycourse_community/core/config/api_endpoints.dart';
import 'package:ezycourse_community/core/services/network_service.dart';

class CreateFeedCommentRepository {
  final NetworkService networkService;
  CreateFeedCommentRepository(this.networkService);
  Future<void> createFeedComment({
    required String commentText,
    required String? token,
    required int feedId,

  }) async {
    try {
      final createCommentUrl = ApiEndpoints.createFeedComment;
      final body = {
        "feed_id": feedId,
        "feed_user_id": 1540368,
        "comment_txt": commentText,
        "commentSource": "COMMUNITY",
        "ids": [],
        "is_discussion": 0

      };

      await networkService.post(body: body, token: token, url: createCommentUrl);
    } catch (e) {
      rethrow;
    }
  }
}