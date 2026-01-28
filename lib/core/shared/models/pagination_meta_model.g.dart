// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_meta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MetaModel _$MetaModelFromJson(Map<String, dynamic> json) => _MetaModel(
  total: (json['total'] as num).toInt(),
  firstPage: (json['first_page'] as num).toInt(),
  lastPage: (json['last_page'] as num).toInt(),
  currentPage: (json['current_page'] as num).toInt(),
);

Map<String, dynamic> _$MetaModelToJson(_MetaModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'first_page': instance.firstPage,
      'last_page': instance.lastPage,
      'current_page': instance.currentPage,
    };
