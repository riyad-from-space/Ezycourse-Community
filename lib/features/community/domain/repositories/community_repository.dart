import 'package:ezycourse_community/features/community/domain/entities/community_channel_entity.dart';
import 'package:ezycourse_community/features/community/domain/entities/community_list_entity.dart';
import 'package:ezycourse_community/features/community/domain/entities/feed_comment_entity.dart';
import 'package:ezycourse_community/features/community/domain/entities/feed_entity.dart';

abstract interface class CommunityRepository {
  Future<List<CommunityListEntity>> getEnrolledCommunities({
    required final String token,
    required final int page,
    required final int limit,
  });

  Future<List<FeedEntity>> getCommunityFeeds({
    required final String token,
    required final int communityId,
    required final int spaceId,
  });

  Future<List<CommunityChannelEntity>> getCommunityChannels({
    required final String token,
    required final int communityId,
  });

  Future<void> createPost({
    required final String postText,
    required final String? token,
    required final int spaceId,
    required final int communityId,
  });

  Future<void> createFeedComment({
    required final String commentText,
    required final String? token,
    required final int feedId,
  });

  Future<void> createPostReact({
    required final int feedId,
    required final String reactType,
    required final String? token,
  });

  Future<List<FeedCommentEntity>> getFeedComments({
    required final String token,
    required final int feedId,
  });
}
