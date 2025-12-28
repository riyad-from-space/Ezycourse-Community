// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FeedModel _$FeedModelFromJson(Map<String, dynamic> json) => _FeedModel(
  id: (json['id'] as num).toInt(),
  schoolId: (json['school_id'] as num).toInt(),
  communityId: (json['community_id'] as num).toInt(),
  spaceId: (json['space_id'] as num).toInt(),
  feedText: json['feed_txt'] as String,
  userName: json['name'] as String,
  userPic: json['pic'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  likeCount: (json['like_count'] as num).toInt(),
  commentCount: (json['comment_count'] as num).toInt(),
  shareCount: (json['share_count'] as num).toInt(),
);

Map<String, dynamic> _$FeedModelToJson(_FeedModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'school_id': instance.schoolId,
      'community_id': instance.communityId,
      'space_id': instance.spaceId,
      'feed_txt': instance.feedText,
      'name': instance.userName,
      'pic': instance.userPic,
      'created_at': instance.createdAt.toIso8601String(),
      'like_count': instance.likeCount,
      'comment_count': instance.commentCount,
      'share_count': instance.shareCount,
    };
