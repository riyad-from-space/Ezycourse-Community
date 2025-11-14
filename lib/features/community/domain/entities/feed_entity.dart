import 'package:equatable/equatable.dart';
import 'enums.dart';
import 'media_file_entity.dart';
import 'poll_entity.dart';
import 'reaction_entity.dart';
import 'user_entity.dart';

/// Entity representing feed metadata (views, impressions, etc.)
class FeedMetaEntity extends Equatable {
  final int views;

  const FeedMetaEntity({required this.views});

  @override
  List<Object?> get props => [views];
}

/// Entity representing a background gradient for text posts
class BackgroundEntity extends Equatable {
  final String backgroundImage;

  const BackgroundEntity({required this.backgroundImage});

  /// Parse background color string from JSON
  /// Example: {"backgroundImage":"linear-gradient(45deg, rgb(255, 127, 17) 0%, rgb(255, 127, 17) 100%)"}
  static BackgroundEntity? fromJsonString(String? bgColorString) {
    if (bgColorString == null || bgColorString.isEmpty) return null;
    
    try {
      // The bgColor field contains a JSON-like string, extract the gradient
      final regex = RegExp(r'"backgroundImage":"([^"]+)"');
      final match = regex.firstMatch(bgColorString);
      
      if (match != null && match.group(1) != null) {
        return BackgroundEntity(backgroundImage: match.group(1)!);
      }
    } catch (e) {
      // If parsing fails, return null
      return null;
    }
    
    return null;
  }

  @override
  List<Object?> get props => [backgroundImage];
}

/// Main entity representing a feed post in the community
class FeedEntity extends Equatable {
  // Core feed properties
  final int id;
  final int schoolId;
  final int userId;
  final int communityId;
  final int spaceId;
  final String feedText;
  final String title;
  final String slug;
  
  // Feed metadata
  final FeedStatus status;
  final ActivityType activityType;
  final FileType fileType;
  final FeedPrivacy privacy;
  final bool isPinned;
  final bool isFeedEdit;
  
  // Timestamps
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishDate;
  
  // Engagement metrics
  final int likeCount;
  final int commentCount;
  final int shareCount;
  final int shareId;
  
  // Content
  final List<MediaFileEntity> files;
  final BackgroundEntity? background;
  final bool hasBackground;
  
  // Related entities
  final UserEntity author;
  final PollEntity? poll;
  final List<ReactionEntity> reactions;
  final List<dynamic> comments; // TODO: Create CommentEntity
  final FeedMetaEntity meta;
  
  // Optional associations
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
  
  // Schedule related
  final DateTime? scheduleDate;
  final String? timezone;
  
  // User-specific state (for current logged-in user)
  final bool? isLiked;
  final bool? isSaved;
  final bool? isFollowing;
  final bool? isAnonymous;

  const FeedEntity({
    required this.id,
    required this.schoolId,
    required this.userId,
    required this.communityId,
    required this.spaceId,
    required this.feedText,
    required this.title,
    required this.slug,
    required this.status,
    required this.activityType,
    required this.fileType,
    required this.privacy,
    required this.isPinned,
    required this.isFeedEdit,
    required this.createdAt,
    required this.updatedAt,
    required this.publishDate,
    required this.likeCount,
    required this.commentCount,
    required this.shareCount,
    required this.shareId,
    required this.files,
    this.background,
    required this.hasBackground,
    required this.author,
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
    this.isLiked,
    this.isSaved,
    this.isFollowing,
    this.isAnonymous,
  });

  // Convenience getters

  /// Check if feed is approved
  bool get isApproved => status == FeedStatus.approved;

  /// Check if feed is a poll
  bool get isPoll => activityType == ActivityType.poll && poll != null;

  /// Check if feed has media files
  bool get hasMedia => files.isNotEmpty;

  /// Check if feed has images
  bool get hasImages => fileType == FileType.photos && files.any((f) => f.isImage);

  /// Check if feed has videos
  bool get hasVideos => fileType == FileType.video && files.any((f) => f.isVideo);

  /// Check if feed is text only
  bool get isTextOnly => fileType == FileType.text && files.isEmpty;

  /// Check if feed has engagement (likes, comments, shares)
  bool get hasEngagement => likeCount > 0 || commentCount > 0 || shareCount > 0;

  /// Check if current user liked this post
  bool get isLikedByUser => isLiked ?? false;

  /// Check if current user saved this post
  bool get isSavedByUser => isSaved ?? false;

  /// Check if feed is public
  bool get isPublic => privacy == FeedPrivacy.public;

  /// Check if feed is scheduled
  bool get isScheduled => scheduleDate != null;

  /// Get total engagement count
  int get totalEngagement => likeCount + commentCount + shareCount;

  /// Get relative time string (e.g., "2 hours ago")
  String get relativeTime {
    final now = DateTime.now();
    final difference = now.difference(createdAt);

    if (difference.inDays > 365) {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    } else if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else {
      return 'Just now';
    }
  }

  @override
  List<Object?> get props => [
        id,
        schoolId,
        userId,
        communityId,
        spaceId,
        feedText,
        title,
        slug,
        status,
        activityType,
        fileType,
        privacy,
        isPinned,
        isFeedEdit,
        createdAt,
        updatedAt,
        publishDate,
        likeCount,
        commentCount,
        shareCount,
        shareId,
        files,
        background,
        hasBackground,
        author,
        poll,
        reactions,
        comments,
        meta,
        courseId,
        groupId,
        pollId,
        lessonId,
        videoId,
        streamId,
        blogId,
        meetingId,
        sellerId,
        coachingFeedId,
        scheduleDate,
        timezone,
        isLiked,
        isSaved,
        isFollowing,
        isAnonymous,
      ];
}
