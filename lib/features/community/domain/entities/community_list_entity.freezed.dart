// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_list_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommunityListEntity {

 int get id; String get title; String get coverImage; int get totalFeeds; int get totalMembers; String get status;
/// Create a copy of CommunityListEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommunityListEntityCopyWith<CommunityListEntity> get copyWith => _$CommunityListEntityCopyWithImpl<CommunityListEntity>(this as CommunityListEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommunityListEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverImage, coverImage) || other.coverImage == coverImage)&&(identical(other.totalFeeds, totalFeeds) || other.totalFeeds == totalFeeds)&&(identical(other.totalMembers, totalMembers) || other.totalMembers == totalMembers)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,coverImage,totalFeeds,totalMembers,status);

@override
String toString() {
  return 'CommunityListEntity(id: $id, title: $title, coverImage: $coverImage, totalFeeds: $totalFeeds, totalMembers: $totalMembers, status: $status)';
}


}

/// @nodoc
abstract mixin class $CommunityListEntityCopyWith<$Res>  {
  factory $CommunityListEntityCopyWith(CommunityListEntity value, $Res Function(CommunityListEntity) _then) = _$CommunityListEntityCopyWithImpl;
@useResult
$Res call({
 int id, String title, String coverImage, int totalFeeds, int totalMembers, String status
});




}
/// @nodoc
class _$CommunityListEntityCopyWithImpl<$Res>
    implements $CommunityListEntityCopyWith<$Res> {
  _$CommunityListEntityCopyWithImpl(this._self, this._then);

  final CommunityListEntity _self;
  final $Res Function(CommunityListEntity) _then;

/// Create a copy of CommunityListEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? coverImage = null,Object? totalFeeds = null,Object? totalMembers = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,coverImage: null == coverImage ? _self.coverImage : coverImage // ignore: cast_nullable_to_non_nullable
as String,totalFeeds: null == totalFeeds ? _self.totalFeeds : totalFeeds // ignore: cast_nullable_to_non_nullable
as int,totalMembers: null == totalMembers ? _self.totalMembers : totalMembers // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CommunityListEntity].
extension CommunityListEntityPatterns on CommunityListEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommunityListEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommunityListEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommunityListEntity value)  $default,){
final _that = this;
switch (_that) {
case _CommunityListEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommunityListEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CommunityListEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String coverImage,  int totalFeeds,  int totalMembers,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommunityListEntity() when $default != null:
return $default(_that.id,_that.title,_that.coverImage,_that.totalFeeds,_that.totalMembers,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String coverImage,  int totalFeeds,  int totalMembers,  String status)  $default,) {final _that = this;
switch (_that) {
case _CommunityListEntity():
return $default(_that.id,_that.title,_that.coverImage,_that.totalFeeds,_that.totalMembers,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String coverImage,  int totalFeeds,  int totalMembers,  String status)?  $default,) {final _that = this;
switch (_that) {
case _CommunityListEntity() when $default != null:
return $default(_that.id,_that.title,_that.coverImage,_that.totalFeeds,_that.totalMembers,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _CommunityListEntity implements CommunityListEntity {
  const _CommunityListEntity({required this.id, required this.title, required this.coverImage, required this.totalFeeds, required this.totalMembers, required this.status});
  

@override final  int id;
@override final  String title;
@override final  String coverImage;
@override final  int totalFeeds;
@override final  int totalMembers;
@override final  String status;

/// Create a copy of CommunityListEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommunityListEntityCopyWith<_CommunityListEntity> get copyWith => __$CommunityListEntityCopyWithImpl<_CommunityListEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommunityListEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverImage, coverImage) || other.coverImage == coverImage)&&(identical(other.totalFeeds, totalFeeds) || other.totalFeeds == totalFeeds)&&(identical(other.totalMembers, totalMembers) || other.totalMembers == totalMembers)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,coverImage,totalFeeds,totalMembers,status);

@override
String toString() {
  return 'CommunityListEntity(id: $id, title: $title, coverImage: $coverImage, totalFeeds: $totalFeeds, totalMembers: $totalMembers, status: $status)';
}


}

/// @nodoc
abstract mixin class _$CommunityListEntityCopyWith<$Res> implements $CommunityListEntityCopyWith<$Res> {
  factory _$CommunityListEntityCopyWith(_CommunityListEntity value, $Res Function(_CommunityListEntity) _then) = __$CommunityListEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String coverImage, int totalFeeds, int totalMembers, String status
});




}
/// @nodoc
class __$CommunityListEntityCopyWithImpl<$Res>
    implements _$CommunityListEntityCopyWith<$Res> {
  __$CommunityListEntityCopyWithImpl(this._self, this._then);

  final _CommunityListEntity _self;
  final $Res Function(_CommunityListEntity) _then;

/// Create a copy of CommunityListEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? coverImage = null,Object? totalFeeds = null,Object? totalMembers = null,Object? status = null,}) {
  return _then(_CommunityListEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,coverImage: null == coverImage ? _self.coverImage : coverImage // ignore: cast_nullable_to_non_nullable
as String,totalFeeds: null == totalFeeds ? _self.totalFeeds : totalFeeds // ignore: cast_nullable_to_non_nullable
as int,totalMembers: null == totalMembers ? _self.totalMembers : totalMembers // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
