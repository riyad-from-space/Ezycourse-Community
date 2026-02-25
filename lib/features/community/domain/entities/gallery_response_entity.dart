import 'package:ezycourse_community/core/shared/entity/pagination_meta_entity.dart';
import 'package:ezycourse_community/features/community/domain/entities/gallery_item_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_response_entity.freezed.dart';

@freezed
sealed class GalleryResponseEntity with _$GalleryResponseEntity {
  const factory GalleryResponseEntity({
    required final PaginationMetaEntity meta,
    required final List<GalleryItemEntity> data,
  }) = _GalleryResponseEntity;
}
