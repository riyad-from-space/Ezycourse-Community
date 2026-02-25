import 'package:ezycourse_community/core/constants/api.dart';
import 'package:ezycourse_community/features/community/data/datasources/community_remote_datasource.dart';
import 'package:ezycourse_community/features/community/domain/entities/community_channel_entity.dart';
import 'package:ezycourse_community/features/community/domain/entities/community_list_entity.dart';
import 'package:ezycourse_community/features/community/domain/entities/feed_comment_entity.dart';
import 'package:ezycourse_community/features/community/domain/entities/feed_entity.dart';
import 'package:ezycourse_community/features/community/domain/entities/gallery_item_entity.dart';
import 'package:ezycourse_community/features/community/domain/repositories/community_repository.dart';

class CommunityRepositoryImpl implements CommunityRepository {
  final CommunityRemoteDatasource remoteDatasource;
  CommunityRepositoryImpl(this.remoteDatasource);

  @override
  Future<List<CommunityListEntity>> getEnrolledCommunities({
    required String token,
    required int page,
    required int limit,
  }) async {
    final url = ApiEndpoints.communityList(page, limit);
    final response = await remoteDatasource.getEnrolledCommunities(
      token: token,
      url: url,
    );
    return response.data.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<FeedEntity>> getCommunityFeeds({
    required String token,
    required int communityId,
    required int spaceId,
  }) async {
    final url = ApiEndpoints.communityFeed(communityId, spaceId);
    final models = await remoteDatasource.getCommunityFeeds(
      token: token,
      url: url,
    );
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<CommunityChannelEntity>> getCommunityChannels({
    required String token,
    required int communityId,
  }) async {
    final url = ApiEndpoints.channelList(communityId);
    final models = await remoteDatasource.getCommunityChannels(
      token: token,
      url: url,
    );
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<void> createPost({
    required String postText,
    required String? token,
    required int spaceId,
    required int communityId,
    List<Map<String, dynamic>>? files,
  }) async {
    // Determine uploadType (matching reference implementation)
    String uploadType;
    if (files == null || files.isEmpty) {
      uploadType = 'text';
    } else {
      final type = (files.first['type'] as String?) ?? 'files';
      uploadType = type == 'image' ? 'photos' : type;
    }

    final url = ApiEndpoints.createPost;
    final body = {
      "feed_txt": postText,
      "community_id": communityId,
      "space_id": spaceId,
      "uploadType": uploadType,
      "activity_type": "group",
      "is_background": 0,
      "files": files ?? [],
      "timezone": "Asia/Dhaka",
      "is_anonymous": 0,
    };

    await remoteDatasource.createPost(token: token, url: url, body: body);
  }

  @override
  Future<void> createFeedComment({
    required String commentText,
    required String? token,
    required int feedId,
  }) async {
    final url = ApiEndpoints.createFeedComment;
    final body = {
      "feed_id": feedId,
      "feed_user_id": 1540368,
      "comment_txt": commentText,
      "commentSource": "COMMUNITY",
      "ids": [],
      "is_discussion": 0,
    };
    await remoteDatasource.createFeedComment(
        token: token, url: url, body: body);
  }

  @override
  Future<void> createPostReact({
    required int feedId,
    required String reactType,
    required String? token,
  }) async {
    final url = ApiEndpoints.createPostReact;
    final body = {
      'feed_id': feedId,
      'reaction_type': reactType,
      "action": "update",
      "reactionSource": "COMMUNITY",
    };
    await remoteDatasource.createPostReact(
        token: token, url: url, body: body);
  }

  @override
  Future<List<FeedCommentEntity>> getFeedComments({
    required String token,
    required int feedId,
  }) async {
    final url = ApiEndpoints.feedComments(feedId);
    final models = await remoteDatasource.getFeedComments(
      token: token,
      url: url,
    );
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<GalleryItemEntity>> getGalleryItems({
    required String token,
    required String fileType,
  }) async {
    final url = ApiEndpoints.galleryItems(fileType);
    final models = await remoteDatasource.getGalleryItems(
      token: token,
      url: url,
    );
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> uploadGalleryFile({
    required String token,
    required String filePath,
    required String fileType,
  }) async {
    final url = fileType == 'video'
        ? ApiEndpoints.uploadVideo
        : ApiEndpoints.uploadImage;
    await remoteDatasource.uploadGalleryFile(
      token: token,
      url: url,
      filePath: filePath,
    );
  }
}
