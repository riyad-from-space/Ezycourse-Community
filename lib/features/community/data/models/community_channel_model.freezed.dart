// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_channel_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommunityChannelModel {

@JsonKey(name: "id") int get channelId;@JsonKey(name: "name") dynamic get channelName;
/// Create a copy of CommunityChannelModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommunityChannelModelCopyWith<CommunityChannelModel> get copyWith => _$CommunityChannelModelCopyWithImpl<CommunityChannelModel>(this as CommunityChannelModel, _$identity);

  /// Serializes this CommunityChannelModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommunityChannelModel&&(identical(other.channelId, channelId) || other.channelId == channelId)&&const DeepCollectionEquality().equals(other.channelName, channelName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,channelId,const DeepCollectionEquality().hash(channelName));

@override
String toString() {
  return 'CommunityChannelModel(channelId: $channelId, channelName: $channelName)';
}


}

/// @nodoc
abstract mixin class $CommunityChannelModelCopyWith<$Res>  {
  factory $CommunityChannelModelCopyWith(CommunityChannelModel value, $Res Function(CommunityChannelModel) _then) = _$CommunityChannelModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int channelId,@JsonKey(name: "name") dynamic channelName
});




}
/// @nodoc
class _$CommunityChannelModelCopyWithImpl<$Res>
    implements $CommunityChannelModelCopyWith<$Res> {
  _$CommunityChannelModelCopyWithImpl(this._self, this._then);

  final CommunityChannelModel _self;
  final $Res Function(CommunityChannelModel) _then;

/// Create a copy of CommunityChannelModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? channelId = null,Object? channelName = freezed,}) {
  return _then(_self.copyWith(
channelId: null == channelId ? _self.channelId : channelId // ignore: cast_nullable_to_non_nullable
as int,channelName: freezed == channelName ? _self.channelName : channelName // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [CommunityChannelModel].
extension CommunityChannelModelPatterns on CommunityChannelModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommunityChannelModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommunityChannelModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommunityChannelModel value)  $default,){
final _that = this;
switch (_that) {
case _CommunityChannelModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommunityChannelModel value)?  $default,){
final _that = this;
switch (_that) {
case _CommunityChannelModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int channelId, @JsonKey(name: "name")  dynamic channelName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommunityChannelModel() when $default != null:
return $default(_that.channelId,_that.channelName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int channelId, @JsonKey(name: "name")  dynamic channelName)  $default,) {final _that = this;
switch (_that) {
case _CommunityChannelModel():
return $default(_that.channelId,_that.channelName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int channelId, @JsonKey(name: "name")  dynamic channelName)?  $default,) {final _that = this;
switch (_that) {
case _CommunityChannelModel() when $default != null:
return $default(_that.channelId,_that.channelName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommunityChannelModel extends CommunityChannelModel {
  const _CommunityChannelModel({@JsonKey(name: "id") required this.channelId, @JsonKey(name: "name") required this.channelName}): super._();
  factory _CommunityChannelModel.fromJson(Map<String, dynamic> json) => _$CommunityChannelModelFromJson(json);

@override@JsonKey(name: "id") final  int channelId;
@override@JsonKey(name: "name") final  dynamic channelName;

/// Create a copy of CommunityChannelModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommunityChannelModelCopyWith<_CommunityChannelModel> get copyWith => __$CommunityChannelModelCopyWithImpl<_CommunityChannelModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommunityChannelModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommunityChannelModel&&(identical(other.channelId, channelId) || other.channelId == channelId)&&const DeepCollectionEquality().equals(other.channelName, channelName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,channelId,const DeepCollectionEquality().hash(channelName));

@override
String toString() {
  return 'CommunityChannelModel(channelId: $channelId, channelName: $channelName)';
}


}

/// @nodoc
abstract mixin class _$CommunityChannelModelCopyWith<$Res> implements $CommunityChannelModelCopyWith<$Res> {
  factory _$CommunityChannelModelCopyWith(_CommunityChannelModel value, $Res Function(_CommunityChannelModel) _then) = __$CommunityChannelModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int channelId,@JsonKey(name: "name") dynamic channelName
});




}
/// @nodoc
class __$CommunityChannelModelCopyWithImpl<$Res>
    implements _$CommunityChannelModelCopyWith<$Res> {
  __$CommunityChannelModelCopyWithImpl(this._self, this._then);

  final _CommunityChannelModel _self;
  final $Res Function(_CommunityChannelModel) _then;

/// Create a copy of CommunityChannelModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? channelId = null,Object? channelName = freezed,}) {
  return _then(_CommunityChannelModel(
channelId: null == channelId ? _self.channelId : channelId // ignore: cast_nullable_to_non_nullable
as int,channelName: freezed == channelName ? _self.channelName : channelName // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
