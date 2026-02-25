import 'package:ezycourse_community/features/community/data/models/community_channel_model.dart';
import 'package:ezycourse_community/features/community/data/models/community_list_response_model.dart';
import 'package:ezycourse_community/features/community/data/models/feed_comment_model.dart';
import 'package:ezycourse_community/features/community/data/models/feed_model.dart';
import 'package:ezycourse_community/features/community/data/models/gallery_item_model.dart';

abstract interface class CommunityRemoteDatasource {
  Future<CommunityListResponseModel> getEnrolledCommunities({
    required final String token,
    required final String url,
  });

  Future<List<FeedModel>> getCommunityFeeds({
    required final String token,
    required final String url,
  });

  Future<List<CommunityChannelModel>> getCommunityChannels({
    required final String token,
    required final String url,
  });

  Future<void> createPost({
    required final String? token,
    required final String url,
    required final Map<String, dynamic> body,
  });

  Future<void> createFeedComment({
    required final String? token,
    required final String url,
    required final Map<String, dynamic> body,
  });

  Future<void> createPostReact({
    required final String? token,
    required final String url,
    required final Map<String, dynamic> body,
  });

  Future<List<FeedCommentModel>> getFeedComments({
    required final String token,
    required final String url,
  });

  Future<List<GalleryItemModel>> getGalleryItems({
    required final String token,
    required final String url,
  });

  Future<void> uploadGalleryFile({
    required final String token,
    required final String url,
    required final String filePath,
  });
}
