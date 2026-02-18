// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_meta_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginationMetaModel {

 int get total;@JsonKey(name: 'first_page') int get firstPage;@JsonKey(name: 'last_page') int get lastPage;@JsonKey(name: 'current_page') int get currentPage;
/// Create a copy of PaginationMetaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationMetaModelCopyWith<PaginationMetaModel> get copyWith => _$PaginationMetaModelCopyWithImpl<PaginationMetaModel>(this as PaginationMetaModel, _$identity);

  /// Serializes this PaginationMetaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationMetaModel&&(identical(other.total, total) || other.total == total)&&(identical(other.firstPage, firstPage) || other.firstPage == firstPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,firstPage,lastPage,currentPage);

@override
String toString() {
  return 'PaginationMetaModel(total: $total, firstPage: $firstPage, lastPage: $lastPage, currentPage: $currentPage)';
}


}

/// @nodoc
abstract mixin class $PaginationMetaModelCopyWith<$Res>  {
  factory $PaginationMetaModelCopyWith(PaginationMetaModel value, $Res Function(PaginationMetaModel) _then) = _$PaginationMetaModelCopyWithImpl;
@useResult
$Res call({
 int total,@JsonKey(name: 'first_page') int firstPage,@JsonKey(name: 'last_page') int lastPage,@JsonKey(name: 'current_page') int currentPage
});




}
/// @nodoc
class _$PaginationMetaModelCopyWithImpl<$Res>
    implements $PaginationMetaModelCopyWith<$Res> {
  _$PaginationMetaModelCopyWithImpl(this._self, this._then);

  final PaginationMetaModel _self;
  final $Res Function(PaginationMetaModel) _then;

/// Create a copy of PaginationMetaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? firstPage = null,Object? lastPage = null,Object? currentPage = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,firstPage: null == firstPage ? _self.firstPage : firstPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginationMetaModel].
extension PaginationMetaModelPatterns on PaginationMetaModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationMetaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationMetaModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationMetaModel value)  $default,){
final _that = this;
switch (_that) {
case _PaginationMetaModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationMetaModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationMetaModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total, @JsonKey(name: 'first_page')  int firstPage, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'current_page')  int currentPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationMetaModel() when $default != null:
return $default(_that.total,_that.firstPage,_that.lastPage,_that.currentPage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total, @JsonKey(name: 'first_page')  int firstPage, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'current_page')  int currentPage)  $default,) {final _that = this;
switch (_that) {
case _PaginationMetaModel():
return $default(_that.total,_that.firstPage,_that.lastPage,_that.currentPage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total, @JsonKey(name: 'first_page')  int firstPage, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'current_page')  int currentPage)?  $default,) {final _that = this;
switch (_that) {
case _PaginationMetaModel() when $default != null:
return $default(_that.total,_that.firstPage,_that.lastPage,_that.currentPage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginationMetaModel extends PaginationMetaModel {
  const _PaginationMetaModel({required this.total, @JsonKey(name: 'first_page') required this.firstPage, @JsonKey(name: 'last_page') required this.lastPage, @JsonKey(name: 'current_page') required this.currentPage}): super._();
  factory _PaginationMetaModel.fromJson(Map<String, dynamic> json) => _$PaginationMetaModelFromJson(json);

@override final  int total;
@override@JsonKey(name: 'first_page') final  int firstPage;
@override@JsonKey(name: 'last_page') final  int lastPage;
@override@JsonKey(name: 'current_page') final  int currentPage;

/// Create a copy of PaginationMetaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationMetaModelCopyWith<_PaginationMetaModel> get copyWith => __$PaginationMetaModelCopyWithImpl<_PaginationMetaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginationMetaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationMetaModel&&(identical(other.total, total) || other.total == total)&&(identical(other.firstPage, firstPage) || other.firstPage == firstPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,firstPage,lastPage,currentPage);

@override
String toString() {
  return 'PaginationMetaModel(total: $total, firstPage: $firstPage, lastPage: $lastPage, currentPage: $currentPage)';
}


}

/// @nodoc
abstract mixin class _$PaginationMetaModelCopyWith<$Res> implements $PaginationMetaModelCopyWith<$Res> {
  factory _$PaginationMetaModelCopyWith(_PaginationMetaModel value, $Res Function(_PaginationMetaModel) _then) = __$PaginationMetaModelCopyWithImpl;
@override @useResult
$Res call({
 int total,@JsonKey(name: 'first_page') int firstPage,@JsonKey(name: 'last_page') int lastPage,@JsonKey(name: 'current_page') int currentPage
});




}
/// @nodoc
class __$PaginationMetaModelCopyWithImpl<$Res>
    implements _$PaginationMetaModelCopyWith<$Res> {
  __$PaginationMetaModelCopyWithImpl(this._self, this._then);

  final _PaginationMetaModel _self;
  final $Res Function(_PaginationMetaModel) _then;

/// Create a copy of PaginationMetaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? firstPage = null,Object? lastPage = null,Object? currentPage = null,}) {
  return _then(_PaginationMetaModel(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,firstPage: null == firstPage ? _self.firstPage : firstPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
