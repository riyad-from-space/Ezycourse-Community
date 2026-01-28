// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_list_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommunityListResponseModel {

@JsonKey(name: 'meta') MetaModel get meta;@JsonKey(name: 'data') List<CommunityListModel> get data;
/// Create a copy of CommunityListResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommunityListResponseModelCopyWith<CommunityListResponseModel> get copyWith => _$CommunityListResponseModelCopyWithImpl<CommunityListResponseModel>(this as CommunityListResponseModel, _$identity);

  /// Serializes this CommunityListResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommunityListResponseModel&&(identical(other.meta, meta) || other.meta == meta)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,meta,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'CommunityListResponseModel(meta: $meta, data: $data)';
}


}

/// @nodoc
abstract mixin class $CommunityListResponseModelCopyWith<$Res>  {
  factory $CommunityListResponseModelCopyWith(CommunityListResponseModel value, $Res Function(CommunityListResponseModel) _then) = _$CommunityListResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'meta') MetaModel meta,@JsonKey(name: 'data') List<CommunityListModel> data
});


$MetaModelCopyWith<$Res> get meta;

}
/// @nodoc
class _$CommunityListResponseModelCopyWithImpl<$Res>
    implements $CommunityListResponseModelCopyWith<$Res> {
  _$CommunityListResponseModelCopyWithImpl(this._self, this._then);

  final CommunityListResponseModel _self;
  final $Res Function(CommunityListResponseModel) _then;

/// Create a copy of CommunityListResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? meta = null,Object? data = null,}) {
  return _then(_self.copyWith(
meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as MetaModel,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<CommunityListModel>,
  ));
}
/// Create a copy of CommunityListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaModelCopyWith<$Res> get meta {
  
  return $MetaModelCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [CommunityListResponseModel].
extension CommunityListResponseModelPatterns on CommunityListResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommunityListResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommunityListResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommunityListResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _CommunityListResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommunityListResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _CommunityListResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'meta')  MetaModel meta, @JsonKey(name: 'data')  List<CommunityListModel> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommunityListResponseModel() when $default != null:
return $default(_that.meta,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'meta')  MetaModel meta, @JsonKey(name: 'data')  List<CommunityListModel> data)  $default,) {final _that = this;
switch (_that) {
case _CommunityListResponseModel():
return $default(_that.meta,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'meta')  MetaModel meta, @JsonKey(name: 'data')  List<CommunityListModel> data)?  $default,) {final _that = this;
switch (_that) {
case _CommunityListResponseModel() when $default != null:
return $default(_that.meta,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommunityListResponseModel implements CommunityListResponseModel {
  const _CommunityListResponseModel({@JsonKey(name: 'meta') required this.meta, @JsonKey(name: 'data') required final  List<CommunityListModel> data}): _data = data;
  factory _CommunityListResponseModel.fromJson(Map<String, dynamic> json) => _$CommunityListResponseModelFromJson(json);

@override@JsonKey(name: 'meta') final  MetaModel meta;
 final  List<CommunityListModel> _data;
@override@JsonKey(name: 'data') List<CommunityListModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of CommunityListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommunityListResponseModelCopyWith<_CommunityListResponseModel> get copyWith => __$CommunityListResponseModelCopyWithImpl<_CommunityListResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommunityListResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommunityListResponseModel&&(identical(other.meta, meta) || other.meta == meta)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,meta,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'CommunityListResponseModel(meta: $meta, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CommunityListResponseModelCopyWith<$Res> implements $CommunityListResponseModelCopyWith<$Res> {
  factory _$CommunityListResponseModelCopyWith(_CommunityListResponseModel value, $Res Function(_CommunityListResponseModel) _then) = __$CommunityListResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'meta') MetaModel meta,@JsonKey(name: 'data') List<CommunityListModel> data
});


@override $MetaModelCopyWith<$Res> get meta;

}
/// @nodoc
class __$CommunityListResponseModelCopyWithImpl<$Res>
    implements _$CommunityListResponseModelCopyWith<$Res> {
  __$CommunityListResponseModelCopyWithImpl(this._self, this._then);

  final _CommunityListResponseModel _self;
  final $Res Function(_CommunityListResponseModel) _then;

/// Create a copy of CommunityListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? meta = null,Object? data = null,}) {
  return _then(_CommunityListResponseModel(
meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as MetaModel,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<CommunityListModel>,
  ));
}

/// Create a copy of CommunityListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaModelCopyWith<$Res> get meta {
  
  return $MetaModelCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}

// dart format on
