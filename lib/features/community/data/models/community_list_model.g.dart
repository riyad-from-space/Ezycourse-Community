// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommunityListModel _$CommunityListModelFromJson(Map<String, dynamic> json) =>
    _CommunityListModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      coverImage: json['cover'] as String,
      totalFeeds: (json['total_feeds'] as num).toInt(),
      totalMembers: (json['total_members'] as num).toInt(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$CommunityListModelToJson(_CommunityListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'cover': instance.coverImage,
      'total_feeds': instance.totalFeeds,
      'total_members': instance.totalMembers,
      'status': instance.status,
    };
