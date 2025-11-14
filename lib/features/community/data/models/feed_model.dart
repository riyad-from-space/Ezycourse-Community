import '../../domain/entities/enums.dart';
import '../../domain/entities/feed_entity.dart';
import 'media_file_model.dart';
import 'poll_model.dart';
import 'reaction_model.dart';
import 'user_model.dart';

/// SIMPLIFIED Model for parsing feed JSON and converting to FeedEntity
/// 
/// This model only includes:
/// 1. fromJson() - Parse API response
/// 2. toEntity() - Convert to domain entity
/// 
/// Removed:
/// - toJson() - Not needed if you only READ feeds
/// - fromEntity() - Not needed if you only READ feeds
/// - Duplicate fields (name, pic, uid) - Already in user object
class FeedModel{
  // Core feed data
  final int id;
  final int schoolId;
  final int userId;
  final int communityId;
  final int spaceId;
  final String feedTxt;
  final String status;
  final String slug;
  final String title;
  final String activityType;
  final String fileType;
  final String feedPrivacy;
  final bool isFeedEdit;
  
  // Timestamps
  final String createdAt;
  final String updatedAt;
  final String publishDate;
  
  // Flags
  final int isPinned;
  final int isBackground;
  final String? bgColor;
  
  // Engagement
  final int likeCount;
  final int commentCount;
  final int shareCount;
  final int shareId;
  
  // Nested objects
  final List<MediaFileModel> files;
  final UserModel user;
  final PollModel? poll;
  final List<ReactionModel> reactions;
  final List<dynamic> comments;
  final Map<String, dynamic> meta;
  
  // Optional IDs (nullable because API returns null)
  final int? courseId;
  final int? groupId;
  final int? pollId;
  final int? lessonId;
  final int? videoId;
  final int? streamId;
  final int? blogId;
  final int? meetingId;
  final int? sellerId;
  final int? coachingFeedId;
  
  // Schedule
  final String? scheduleDate;
  final String? timezone;
  final bool? isAnonymous;
  
  // User-specific state
  final dynamic like;
  final dynamic savedPosts;
  final dynamic follow;

  const FeedModel({
    required this.id,
    required this.schoolId,
    required this.userId,
    required this.communityId,
    required this.spaceId,
    required this.feedTxt,
    required this.status,
    required this.slug,
    required this.title,
    required this.activityType,
    required this.fileType,
    required this.feedPrivacy,
    required this.isFeedEdit,
    required this.createdAt,
    required this.updatedAt,
    required this.publishDate,
    required this.isPinned,
    required this.isBackground,
    this.bgColor,
    required this.likeCount,
    required this.commentCount,
    required this.shareCount,
    required this.shareId,
    required this.files,
    required this.user,
    this.poll,
    required this.reactions,
    required this.comments,
    required this.meta,
    this.courseId,
    this.groupId,
    this.pollId,
    this.lessonId,
    this.videoId,
    this.streamId,
    this.blogId,
    this.meetingId,
    this.sellerId,
    this.coachingFeedId,
    this.scheduleDate,
    this.timezone,
    this.isAnonymous,
    this.like,
    this.savedPosts,
    this.follow,
  });

  /// Parse from JSON - THE ONLY THING YOU NEED FOR READING
  factory FeedModel.fromJson(Map<String, dynamic> json) {
    return FeedModel(
      // Core data
      id: json['id'] ?? 0,
      schoolId: json['school_id'] ?? 0,
      userId: json['user_id'] ?? 0,
      communityId: json['community_id'] ?? 0,
      spaceId: json['space_id'] ?? 0,
      feedTxt: json['feed_txt'] ?? '',
      status: json['status'] ?? 'APPROVED',
      slug: json['slug'] ?? '',
      title: json['title'] ?? '',
      activityType: json['activity_type'] ?? 'group',
      fileType: json['file_type'] ?? 'text',
      feedPrivacy: json['feed_privacy'] ?? 'Public',
      isFeedEdit: json['is_feed_edit'] ?? false,
      
      // Timestamps
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      publishDate: json['publish_date'] ?? '',
      
      // Flags
      isPinned: json['is_pinned'] ?? 0,
      isBackground: json['is_background'] ?? 0,
      bgColor: json['bg_color'],
      
      // Engagement
      likeCount: json['like_count'] ?? 0,
      commentCount: json['comment_count'] ?? 0,
      shareCount: json['share_count'] ?? 0,
      shareId: json['share_id'] ?? 0,
      
      // Nested objects
      files: (json['files'] as List<dynamic>?)
              ?.map((file) => MediaFileModel.fromJson(file))
              .toList() ?? [],
      user: UserModel.fromJson(json['user'] ?? {}),
      poll: json['poll'] != null ? PollModel.fromJson(json['poll']) : null,
      reactions: (json['likeType'] as List<dynamic>?)
              ?.map((r) => ReactionModel.fromJson(r))
              .toList() ?? [],
      comments: json['comments'] ?? [],
      meta: json['meta'] ?? {},
      
      // Optional IDs
      courseId: json['course_id'],
      groupId: json['group_id'],
      pollId: json['poll_id'],
      lessonId: json['lesson_id'],
      videoId: json['video_id'],
      streamId: json['stream_id'],
      blogId: json['blog_id'],
      meetingId: json['meeting_id'],
      sellerId: json['seller_id'],
      coachingFeedId: json['coaching_feed_id'],
      
      // Schedule
      scheduleDate: json['schedule_date'],
      timezone: json['timezone'],
      isAnonymous: json['is_anonymous'],
      
      // User state
      like: json['like'],
      savedPosts: json['savedPosts'],
      follow: json['follow'],
    );
  }

  /// Convert to domain entity - CORE BUSINESS LOGIC
  FeedEntity toEntity() {
    return FeedEntity(
      id: id,
      schoolId: schoolId,
      userId: userId,
      communityId: communityId,
      spaceId: spaceId,
      feedText: feedTxt,
      title: title,
      slug: slug,
      status: FeedStatus.fromString(status),
      activityType: ActivityType.fromString(activityType),
      fileType: FileType.fromString(fileType),
      privacy: FeedPrivacy.fromString(feedPrivacy),
      isPinned: isPinned == 1,
      isFeedEdit: isFeedEdit,
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.parse(updatedAt),
      publishDate: DateTime.parse(publishDate),
      likeCount: likeCount,
      commentCount: commentCount,
      shareCount: shareCount,
      shareId: shareId,
      files: files.map((file) => file.toEntity()).toList(),
      background: BackgroundEntity.fromJsonString(bgColor),
      hasBackground: isBackground > 0,
      author: user.toEntity(),
      poll: poll?.toEntity(),
      reactions: reactions.map((r) => r.toEntity()).toList(),
      comments: comments,
      meta: FeedMetaEntity(views: meta['views'] ?? 0),
      courseId: courseId,
      groupId: groupId,
      pollId: pollId,
      lessonId: lessonId,
      videoId: videoId,
      streamId: streamId,
      blogId: blogId,
      meetingId: meetingId,
      sellerId: sellerId,
      coachingFeedId: coachingFeedId,
      scheduleDate: scheduleDate != null ? DateTime.tryParse(scheduleDate!) : null,
      timezone: timezone,
      isLiked: like != null,
      isSaved: savedPosts != null,
      isFollowing: follow != null,
      isAnonymous: isAnonymous,
    );
  }
}
