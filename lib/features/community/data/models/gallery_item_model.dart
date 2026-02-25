import 'dart:convert';

import 'package:ezycourse_community/features/community/domain/entities/gallery_item_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_item_model.freezed.dart';
part 'gallery_item_model.g.dart';

@freezed
abstract class GalleryItemModel with _$GalleryItemModel {
  const GalleryItemModel._();

  const factory GalleryItemModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'file_name') required String fileName,
    @JsonKey(name: 'file_type') required String fileType,
    @JsonKey(name: 'original_name') String? originalName,
    @JsonKey(name: 'meta') required String meta,
  }) = _GalleryItemModel;

  factory GalleryItemModel.fromJson(Map<String, Object?> json) =>
      _$GalleryItemModelFromJson(json);

  GalleryItemEntity toEntity() {
    final metaParsed = jsonDecode(meta) as Map<String, dynamic>;
    final metaOriginalName =
        metaParsed['original_name'] as String? ?? originalName ?? fileName;

    final String fileLink;
    final String? thumbnailUrl;
    if (fileType == 'video') {
      fileLink = metaParsed['hls_link'] as String? ??
          metaParsed['play_link'] as String? ??
          '';
      thumbnailUrl = metaParsed['thumbnail_link'] as String?;
    } else {
      fileLink = metaParsed['file_link'] as String? ?? '';
      thumbnailUrl = null;
    }

    return GalleryItemEntity(
      id: id,
      fileName: fileName,
      fileType: fileType,
      originalName: metaOriginalName,
      fileLink: fileLink,
      thumbnailUrl: thumbnailUrl,
    );
  }
}
