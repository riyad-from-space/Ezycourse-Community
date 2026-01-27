// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommunityResponseModel _$CommunityResponseModelFromJson(
  Map<String, dynamic> json,
) => _CommunityResponseModel(
  meta: MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
  data: (json['data'] as List<dynamic>)
      .map((e) => CommunityListModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CommunityResponseModelToJson(
  _CommunityResponseModel instance,
) => <String, dynamic>{'meta': instance.meta, 'data': instance.data};
