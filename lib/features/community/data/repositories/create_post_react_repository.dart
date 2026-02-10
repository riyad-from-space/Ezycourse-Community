import 'package:ezycourse_community/core/config/api_endpoints.dart';
import 'package:ezycourse_community/core/services/network_service.dart';

class CreatePostReactRepository {
  final NetworkService networkService;
  CreatePostReactRepository(this.networkService);

  Future<void> createPostReact({
    required String feedId,
    required String reactType,
    required String? token
  }) async {
    try {
      final createReactUrl= ApiEndpoints.createPostReact;
       final body = {
          'feed_id': feedId,
          'reaction_type': reactType,
          "action": "update",
          "reactionSource": "COMMUNITY"
        };
      await networkService.post(
        url: createReactUrl,
        token: token,
        body: body,
      );
    } catch (e) {
      rethrow;
    }
  }
}
