import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_meta_model.freezed.dart';

part 'pagination_meta_model.g.dart';

@freezed
abstract class MetaModel with _$MetaModel {
  const factory MetaModel({
    @JsonKey(name: 'total') required int total,
    @JsonKey(name: 'first_page') required int firstPage,
    @JsonKey(name: 'last_page') required int lastPage,
    @JsonKey(name: 'current_page') required int currentPage,
    }) =
      _MetaModel;

  factory MetaModel.fromJson(Map<String, Object?> json) =>
      _$MetaModelFromJson(json);
}
