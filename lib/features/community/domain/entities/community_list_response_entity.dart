import 'package:ezycourse_community/core/shared/entity/pagination_meta_entity.dart';
import 'package:ezycourse_community/features/community/domain/entities/community_list_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_list_response_entity.freezed.dart';

@freezed
/// Get community response entity representing the API response for community.
sealed class CommunityListResponseEntity with _$CommunityListResponseEntity {
  const factory CommunityListResponseEntity({
    required final PaginationMetaEntity meta,
    required final List<CommunityListEntity> data,
  }) = _CommunityListResponseEntity;
}
