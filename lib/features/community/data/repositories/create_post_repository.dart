import 'package:ezycourse_community/core/config/api_endpoints.dart';
import 'package:ezycourse_community/core/services/network_service.dart';

class CreatePostRepository {
  final NetworkService networkService;

  CreatePostRepository(this.networkService);

  Future<void> createPost({
    required String postText,
    required String? token,
    required int spaceId,
    required int communityId,
  }) async {
    try {
      final createPostUrl = ApiEndpoints.createPost;
      final body = {
        "feed_txt": postText,
        "community_id": communityId,
        "space_id": spaceId,
        "uploadType": "text",
        "activity_type": "group",
        "is_background": 0,
        "files": [],
        "timezone": "Asia/Dhaka",
        "is_anonymous": 0,
      };

      await networkService.post(body: body, token: token, url: createPostUrl);
    } catch (e) {
      rethrow;
    }
  }
}
