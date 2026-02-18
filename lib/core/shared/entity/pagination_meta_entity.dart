import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_meta_entity.freezed.dart';

@freezed
/// Paginated meta entity representing pagination metadata.
sealed class PaginationMetaEntity  with _$PaginationMetaEntity {
  const factory PaginationMetaEntity({
    required final int total,


    required final int lastPage,
    required final int firstPage,
    required final int currentPage,

  }) = _PaginationMetaEntity;
}
