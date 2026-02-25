// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FeedFileModel _$FeedFileModelFromJson(Map<String, dynamic> json) =>
    _FeedFileModel(
      fileLoc: json['fileLoc'] as String? ?? '',
      fileName: json['originalName'] as String? ?? '',
      fileExt: json['extname'] as String? ?? '',
      fileType: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$FeedFileModelToJson(_FeedFileModel instance) =>
    <String, dynamic>{
      'fileLoc': instance.fileLoc,
      'originalName': instance.fileName,
      'extname': instance.fileExt,
      'type': instance.fileType,
    };
