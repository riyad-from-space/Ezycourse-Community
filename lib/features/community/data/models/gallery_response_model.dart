import 'package:ezycourse_community/core/shared/models/pagination_meta_model.dart';
import 'package:ezycourse_community/features/community/data/models/gallery_item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_response_model.freezed.dart';
part 'gallery_response_model.g.dart';

@freezed
abstract class GalleryResponseModel with _$GalleryResponseModel {
  const factory GalleryResponseModel({
    @JsonKey(name: 'meta') required PaginationMetaModel meta,
    @JsonKey(name: 'data') required List<GalleryItemModel> data,
  }) = _GalleryResponseModel;

  factory GalleryResponseModel.fromJson(Map<String, Object?> json) =>
      _$GalleryResponseModelFromJson(json);
}
