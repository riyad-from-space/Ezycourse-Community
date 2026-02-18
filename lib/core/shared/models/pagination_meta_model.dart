import 'package:ezycourse_community/core/shared/entity/pagination_meta_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_meta_model.freezed.dart';

part 'pagination_meta_model.g.dart';

@freezed
abstract class PaginationMetaModel with _$PaginationMetaModel {
  const PaginationMetaModel._();
  const factory PaginationMetaModel({
    required int total,
    @JsonKey(name: 'first_page') required int firstPage,
    @JsonKey(name: 'last_page') required int lastPage,
    @JsonKey(name: 'current_page') required int currentPage,
  }) = _PaginationMetaModel;

  factory PaginationMetaModel.fromJson(Map<String, Object?> json) =>
      _$PaginationMetaModelFromJson(json);

  PaginationMetaEntity toEntity() {
    return PaginationMetaEntity(
      total: total,
      firstPage: firstPage,
      lastPage: lastPage,
      currentPage: currentPage,
    );
  }
}
