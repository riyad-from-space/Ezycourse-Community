// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommunityListResponseModel _$CommunityListResponseModelFromJson(
  Map<String, dynamic> json,
) => _CommunityListResponseModel(
  meta: MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
  data: (json['data'] as List<dynamic>)
      .map((e) => CommunityListModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CommunityListResponseModelToJson(
  _CommunityListResponseModel instance,
) => <String, dynamic>{'meta': instance.meta, 'data': instance.data};
