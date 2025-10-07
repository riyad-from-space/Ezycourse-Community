class FeedModel {
  int id;
  int schoolId;
  int userId;
  dynamic courseId;
  int communityId;
  dynamic groupId;
  String feedTxt;
  FeedModelStatus status;
  String slug;
  String title;
  ActivityType activityType;
  int isPinned;
  FileType fileType;
  List<FileElement> files;
  int likeCount;
  int commentCount;
  int shareCount;
  int shareId;
  MetaDataClass metaData;
  DateTime createdAt;
  DateTime updatedAt;
  FeedPrivacy feedPrivacy;
  int isBackground;
  String? bgColor;
  int? pollId;
  dynamic lessonId;
  int spaceId;
  dynamic videoId;
  dynamic streamId;
  dynamic blogId;
  dynamic scheduleDate;
  dynamic timezone;
  dynamic isAnonymous;
  dynamic meetingId;
  dynamic sellerId;
  DateTime publishDate;
  dynamic coachingFeedId;
  bool isFeedEdit;
  Name name;
  String pic;
  int uid;
  int isPrivateChat;
  dynamic group;
  List<LikeType> likeType;
  dynamic savedPosts;
  dynamic follow;
  Poll? poll;
  FeedModelUser user;
  dynamic like;
  List<dynamic> comments;
  PurpleMeta meta;

  FeedModel({
    required this.id,
    required this.schoolId,
    required this.userId,
    required this.courseId,
    required this.communityId,
    required this.groupId,
    required this.feedTxt,
    required this.status,
    required this.slug,
    required this.title,
    required this.activityType,
    required this.isPinned,
    required this.fileType,
    required this.files,
    required this.likeCount,
    required this.commentCount,
    required this.shareCount,
    required this.shareId,
    required this.metaData,
    required this.createdAt,
    required this.updatedAt,
    required this.feedPrivacy,
    required this.isBackground,
    required this.bgColor,
    required this.pollId,
    required this.lessonId,
    required this.spaceId,
    required this.videoId,
    required this.streamId,
    required this.blogId,
    required this.scheduleDate,
    required this.timezone,
    required this.isAnonymous,
    required this.meetingId,
    required this.sellerId,
    required this.publishDate,
    required this.coachingFeedId,
    required this.isFeedEdit,
    required this.name,
    required this.pic,
    required this.uid,
    required this.isPrivateChat,
    required this.group,
    required this.likeType,
    required this.savedPosts,
    required this.follow,
    required this.poll,
    required this.user,
    required this.like,
    required this.comments,
    required this.meta,
  });

  static Future<FeedModel> fromJson(jsonData) async {
    await Future.delayed(const Duration(seconds: 2));
    return FeedModel(
      id: jsonData['id'],
      schoolId: jsonData['school_id'],
      userId: jsonData['user_id'],
      courseId: jsonData['course_id'],
      communityId: jsonData['community_id'],
      groupId: jsonData['group_id'],
      feedTxt: jsonData['feed_txt'],
      status: FeedModelStatus.APPROVED,
      slug: jsonData['slug'],
      title: jsonData['title'],
      activityType: ActivityType.GROUP,
      isPinned: jsonData['is_pinned'],
      fileType: FileType.PHOTOS,
      files: List<FileElement>.from(
        jsonData['files'].map(
          (x) => FileElement(
            playLink: x['play_link'],
            hlsLink: x['hls_link'],
            thumbnailLink: x['thumbnail_link'],
            fileLoc: x['file_loc'],
            originalName: x['original_name'],
            extname: x['extname'],
            size: x['size'],
            type: x['type'],
            videoId: x['video_id'],
          ),
        ),
      ),
      likeCount: jsonData['like_count'],
      commentCount: jsonData['comment_count'],
      shareCount: jsonData['share_count'],
      shareId: jsonData['share_id'],
      metaData: MetaDataClass(),
      createdAt: DateTime.parse(jsonData['created_at']),
      updatedAt: DateTime.parse(jsonData['updated_at']),
      feedPrivacy: FeedPrivacy.PUBLIC,
      isBackground: jsonData['is_background'],
      bgColor: jsonData['bg_color'],
      pollId: jsonData['poll_id'],
      lessonId: jsonData['lesson_id'],
      spaceId: jsonData['space_id'],
      videoId: jsonData['video_id'],
      streamId: jsonData['stream_id'],
      blogId: jsonData['blog_id'],
      scheduleDate: jsonData['schedule_date'],
      timezone: jsonData['timezone'],
      isAnonymous: jsonData['is_anonymous'],
      meetingId: jsonData['meeting_id'],
      sellerId: jsonData['seller_id'],
      publishDate: DateTime.parse(jsonData['publish_date']),
      coachingFeedId: jsonData['coaching_feed_id'],
      isFeedEdit: jsonData['is_feed_edit'],
      name: Name.EZY_STUDENT,
      pic: jsonData['pic'],
      uid: jsonData['uid'],
      isPrivateChat: jsonData['is_private_chat'],
      group: jsonData['group'],
      likeType: List<LikeType>.from(
        jsonData['like_type'].map(
          (x) => LikeType(
            reactionType: x['reaction_type'],
            feedId: x['feed_id'],
            meta: MetaDataClass(),
          ),
        ),
      ),
      savedPosts: jsonData['saved_posts'],
      follow: jsonData['follow'],
      poll: jsonData['poll'] != null
          ? Poll(
              id: jsonData['poll']['id'],
              isMultipleSelected: jsonData['poll']['is_multiple_selected'],
              allowUserAddOption: jsonData['poll']['allow_user_add_option'],
              createdAt: DateTime.parse(jsonData['poll']['created_at']),
              updatedAt: DateTime.parse(jsonData['poll']['updated_at']),
              voteByAnyOne: jsonData['poll']['vote_by_any_one'],
              isVotedOne: jsonData['poll']['is_voted_one'],
              pollOptions: List<PollOption>.from(
                jsonData['poll']['poll_options'].map(
                  (x) => PollOption(
                    id: x['id'],
                    userId: x['user_id'],
                    pollId: x['poll_id'],
                    text: x['text'],
                    totalVote: x['total_vote'],
                    createdAt: DateTime.parse(x['created_at']),
                    updatedAt: DateTime.parse(x['updated_at']),
                    voteOption: List<dynamic>.from(
                      x['vote_option'].map((v) => v),
                    ),
                    isVoted: x['is_voted'],
                    user: PollOptionUser(
                      id: x['user']['id'],
                      fullName: Name.SONIYA_MALIK,
                      profilePic: x['user']['profile_pic'],
                      meta: MetaDataClass(),
                    ),
                  ),
                ),
              ),
            )
          : null,
      user: FeedModelUser(
        id: jsonData['user']['id'],
        fullName: Name.EZY_STUDENT,
        profilePic: jsonData['user']['profile_pic'],
        isPrivateChat: jsonData['user']['is_private_chat'],
        expireDate: jsonData['user']['expire_date'],
        status: UserStatus.ACTIVE,
        pauseDate: jsonData['user']['pause_date'],
        userType: UserType.STUDENT,
        meta: MetaDataClass(),
      ),
      like: jsonData['like'],
      comments: List<dynamic>.from(jsonData['comments'].map((x) => x)),
      meta: PurpleMeta(views: jsonData['meta']['views']),
    );
  }
}

enum ActivityType { GROUP, POLL }

enum FeedPrivacy { PUBLIC }

enum FileType { PHOTOS, TEXT }

class FileElement {
  dynamic playLink;
  dynamic hlsLink;
  dynamic thumbnailLink;
  String fileLoc;
  String originalName;
  String extname;
  int size;
  String type;
  dynamic videoId;

  FileElement({
    required this.playLink,
    required this.hlsLink,
    required this.thumbnailLink,
    required this.fileLoc,
    required this.originalName,
    required this.extname,
    required this.size,
    required this.type,
    required this.videoId,
  });
}

class LikeType {
  String reactionType;
  int feedId;
  MetaDataClass meta;

  LikeType({
    required this.reactionType,
    required this.feedId,
    required this.meta,
  });
}

class MetaDataClass {
  MetaDataClass();
}

class PurpleMeta {
  int views;

  PurpleMeta({required this.views});
}

enum Name { EZY_STUDENT, SONIYA_MALIK }

class Poll {
  int id;
  int isMultipleSelected;
  int allowUserAddOption;
  DateTime createdAt;
  DateTime updatedAt;
  String voteByAnyOne;
  dynamic isVotedOne;
  List<PollOption> pollOptions;

  Poll({
    required this.id,
    required this.isMultipleSelected,
    required this.allowUserAddOption,
    required this.createdAt,
    required this.updatedAt,
    required this.voteByAnyOne,
    required this.isVotedOne,
    required this.pollOptions,
  });
}

class PollOption {
  int id;
  int userId;
  int pollId;
  String text;
  int totalVote;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> voteOption;
  dynamic isVoted;
  PollOptionUser user;

  PollOption({
    required this.id,
    required this.userId,
    required this.pollId,
    required this.text,
    required this.totalVote,
    required this.createdAt,
    required this.updatedAt,
    required this.voteOption,
    required this.isVoted,
    required this.user,
  });
}

class PollOptionUser {
  int id;
  Name fullName;
  String profilePic;
  MetaDataClass meta;

  PollOptionUser({
    required this.id,
    required this.fullName,
    required this.profilePic,
    required this.meta,
  });
}

enum FeedModelStatus { APPROVED }

class FeedModelUser {
  int id;
  Name fullName;
  String profilePic;
  int isPrivateChat;
  dynamic expireDate;
  UserStatus status;
  dynamic pauseDate;
  UserType userType;
  MetaDataClass meta;

  FeedModelUser({
    required this.id,
    required this.fullName,
    required this.profilePic,
    required this.isPrivateChat,
    required this.expireDate,
    required this.status,
    required this.pauseDate,
    required this.userType,
    required this.meta,
  });
}

enum UserStatus { ACTIVE }

enum UserType { STUDENT }
