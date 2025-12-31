// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FeedEntity {

 int get id; int get schoolId; int get communityId; int get spaceId; String get feedText; String get userName; String get userPic; DateTime get createdAt; int get likeCount; int get commentCount; int get shareCount; List<FeedFileEntity> get files;
/// Create a copy of FeedEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedEntityCopyWith<FeedEntity> get copyWith => _$FeedEntityCopyWithImpl<FeedEntity>(this as FeedEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.communityId, communityId) || other.communityId == communityId)&&(identical(other.spaceId, spaceId) || other.spaceId == spaceId)&&(identical(other.feedText, feedText) || other.feedText == feedText)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userPic, userPic) || other.userPic == userPic)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.commentCount, commentCount) || other.commentCount == commentCount)&&(identical(other.shareCount, shareCount) || other.shareCount == shareCount)&&const DeepCollectionEquality().equals(other.files, files));
}


@override
int get hashCode => Object.hash(runtimeType,id,schoolId,communityId,spaceId,feedText,userName,userPic,createdAt,likeCount,commentCount,shareCount,const DeepCollectionEquality().hash(files));

@override
String toString() {
  return 'FeedEntity(id: $id, schoolId: $schoolId, communityId: $communityId, spaceId: $spaceId, feedText: $feedText, userName: $userName, userPic: $userPic, createdAt: $createdAt, likeCount: $likeCount, commentCount: $commentCount, shareCount: $shareCount, files: $files)';
}


}

/// @nodoc
abstract mixin class $FeedEntityCopyWith<$Res>  {
  factory $FeedEntityCopyWith(FeedEntity value, $Res Function(FeedEntity) _then) = _$FeedEntityCopyWithImpl;
@useResult
$Res call({
 int id, int schoolId, int communityId, int spaceId, String feedText, String userName, String userPic, DateTime createdAt, int likeCount, int commentCount, int shareCount, List<FeedFileEntity> files
});




}
/// @nodoc
class _$FeedEntityCopyWithImpl<$Res>
    implements $FeedEntityCopyWith<$Res> {
  _$FeedEntityCopyWithImpl(this._self, this._then);

  final FeedEntity _self;
  final $Res Function(FeedEntity) _then;

/// Create a copy of FeedEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? schoolId = null,Object? communityId = null,Object? spaceId = null,Object? feedText = null,Object? userName = null,Object? userPic = null,Object? createdAt = null,Object? likeCount = null,Object? commentCount = null,Object? shareCount = null,Object? files = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as int,communityId: null == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as int,spaceId: null == spaceId ? _self.spaceId : spaceId // ignore: cast_nullable_to_non_nullable
as int,feedText: null == feedText ? _self.feedText : feedText // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,userPic: null == userPic ? _self.userPic : userPic // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,commentCount: null == commentCount ? _self.commentCount : commentCount // ignore: cast_nullable_to_non_nullable
as int,shareCount: null == shareCount ? _self.shareCount : shareCount // ignore: cast_nullable_to_non_nullable
as int,files: null == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as List<FeedFileEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [FeedEntity].
extension FeedEntityPatterns on FeedEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeedEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeedEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeedEntity value)  $default,){
final _that = this;
switch (_that) {
case _FeedEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeedEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FeedEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int schoolId,  int communityId,  int spaceId,  String feedText,  String userName,  String userPic,  DateTime createdAt,  int likeCount,  int commentCount,  int shareCount,  List<FeedFileEntity> files)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedEntity() when $default != null:
return $default(_that.id,_that.schoolId,_that.communityId,_that.spaceId,_that.feedText,_that.userName,_that.userPic,_that.createdAt,_that.likeCount,_that.commentCount,_that.shareCount,_that.files);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int schoolId,  int communityId,  int spaceId,  String feedText,  String userName,  String userPic,  DateTime createdAt,  int likeCount,  int commentCount,  int shareCount,  List<FeedFileEntity> files)  $default,) {final _that = this;
switch (_that) {
case _FeedEntity():
return $default(_that.id,_that.schoolId,_that.communityId,_that.spaceId,_that.feedText,_that.userName,_that.userPic,_that.createdAt,_that.likeCount,_that.commentCount,_that.shareCount,_that.files);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int schoolId,  int communityId,  int spaceId,  String feedText,  String userName,  String userPic,  DateTime createdAt,  int likeCount,  int commentCount,  int shareCount,  List<FeedFileEntity> files)?  $default,) {final _that = this;
switch (_that) {
case _FeedEntity() when $default != null:
return $default(_that.id,_that.schoolId,_that.communityId,_that.spaceId,_that.feedText,_that.userName,_that.userPic,_that.createdAt,_that.likeCount,_that.commentCount,_that.shareCount,_that.files);case _:
  return null;

}
}

}

/// @nodoc


class _FeedEntity implements FeedEntity {
  const _FeedEntity({required this.id, required this.schoolId, required this.communityId, required this.spaceId, required this.feedText, required this.userName, required this.userPic, required this.createdAt, required this.likeCount, required this.commentCount, required this.shareCount, required final  List<FeedFileEntity> files}): _files = files;
  

@override final  int id;
@override final  int schoolId;
@override final  int communityId;
@override final  int spaceId;
@override final  String feedText;
@override final  String userName;
@override final  String userPic;
@override final  DateTime createdAt;
@override final  int likeCount;
@override final  int commentCount;
@override final  int shareCount;
 final  List<FeedFileEntity> _files;
@override List<FeedFileEntity> get files {
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_files);
}


/// Create a copy of FeedEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedEntityCopyWith<_FeedEntity> get copyWith => __$FeedEntityCopyWithImpl<_FeedEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.communityId, communityId) || other.communityId == communityId)&&(identical(other.spaceId, spaceId) || other.spaceId == spaceId)&&(identical(other.feedText, feedText) || other.feedText == feedText)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userPic, userPic) || other.userPic == userPic)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.commentCount, commentCount) || other.commentCount == commentCount)&&(identical(other.shareCount, shareCount) || other.shareCount == shareCount)&&const DeepCollectionEquality().equals(other._files, _files));
}


@override
int get hashCode => Object.hash(runtimeType,id,schoolId,communityId,spaceId,feedText,userName,userPic,createdAt,likeCount,commentCount,shareCount,const DeepCollectionEquality().hash(_files));

@override
String toString() {
  return 'FeedEntity(id: $id, schoolId: $schoolId, communityId: $communityId, spaceId: $spaceId, feedText: $feedText, userName: $userName, userPic: $userPic, createdAt: $createdAt, likeCount: $likeCount, commentCount: $commentCount, shareCount: $shareCount, files: $files)';
}


}

/// @nodoc
abstract mixin class _$FeedEntityCopyWith<$Res> implements $FeedEntityCopyWith<$Res> {
  factory _$FeedEntityCopyWith(_FeedEntity value, $Res Function(_FeedEntity) _then) = __$FeedEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, int schoolId, int communityId, int spaceId, String feedText, String userName, String userPic, DateTime createdAt, int likeCount, int commentCount, int shareCount, List<FeedFileEntity> files
});




}
/// @nodoc
class __$FeedEntityCopyWithImpl<$Res>
    implements _$FeedEntityCopyWith<$Res> {
  __$FeedEntityCopyWithImpl(this._self, this._then);

  final _FeedEntity _self;
  final $Res Function(_FeedEntity) _then;

/// Create a copy of FeedEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? schoolId = null,Object? communityId = null,Object? spaceId = null,Object? feedText = null,Object? userName = null,Object? userPic = null,Object? createdAt = null,Object? likeCount = null,Object? commentCount = null,Object? shareCount = null,Object? files = null,}) {
  return _then(_FeedEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as int,communityId: null == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as int,spaceId: null == spaceId ? _self.spaceId : spaceId // ignore: cast_nullable_to_non_nullable
as int,feedText: null == feedText ? _self.feedText : feedText // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,userPic: null == userPic ? _self.userPic : userPic // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,commentCount: null == commentCount ? _self.commentCount : commentCount // ignore: cast_nullable_to_non_nullable
as int,shareCount: null == shareCount ? _self.shareCount : shareCount // ignore: cast_nullable_to_non_nullable
as int,files: null == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<FeedFileEntity>,
  ));
}


}

// dart format on
