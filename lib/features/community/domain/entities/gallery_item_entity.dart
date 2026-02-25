import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_item_entity.freezed.dart';

@freezed
sealed class GalleryItemEntity with _$GalleryItemEntity {
  const factory GalleryItemEntity({
    required final int id,
    required final String fileName,
    required final String fileType,
    required final String originalName,
    required final String fileLink,
    final String? thumbnailUrl,
  }) = _GalleryItemEntity;
}
