// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedModel {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'school_id') int get schoolId;@JsonKey(name: 'community_id') int get communityId;@JsonKey(name: 'space_id') int get spaceId;@JsonKey(name: 'feed_txt') String get feedText;@JsonKey(name: 'name') String get userName;@JsonKey(name: 'pic') String get userPic;@JsonKey(name: 'created_at') DateTime get createdAt;//ENGAGEMENT FIELDS
@JsonKey(name: 'like_count') int get likeCount;@JsonKey(name: 'comment_count') int get commentCount;@JsonKey(name: 'share_count') int get shareCount;
/// Create a copy of FeedModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedModelCopyWith<FeedModel> get copyWith => _$FeedModelCopyWithImpl<FeedModel>(this as FeedModel, _$identity);

  /// Serializes this FeedModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.communityId, communityId) || other.communityId == communityId)&&(identical(other.spaceId, spaceId) || other.spaceId == spaceId)&&(identical(other.feedText, feedText) || other.feedText == feedText)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userPic, userPic) || other.userPic == userPic)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.commentCount, commentCount) || other.commentCount == commentCount)&&(identical(other.shareCount, shareCount) || other.shareCount == shareCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,schoolId,communityId,spaceId,feedText,userName,userPic,createdAt,likeCount,commentCount,shareCount);

@override
String toString() {
  return 'FeedModel(id: $id, schoolId: $schoolId, communityId: $communityId, spaceId: $spaceId, feedText: $feedText, userName: $userName, userPic: $userPic, createdAt: $createdAt, likeCount: $likeCount, commentCount: $commentCount, shareCount: $shareCount)';
}


}

/// @nodoc
abstract mixin class $FeedModelCopyWith<$Res>  {
  factory $FeedModelCopyWith(FeedModel value, $Res Function(FeedModel) _then) = _$FeedModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'school_id') int schoolId,@JsonKey(name: 'community_id') int communityId,@JsonKey(name: 'space_id') int spaceId,@JsonKey(name: 'feed_txt') String feedText,@JsonKey(name: 'name') String userName,@JsonKey(name: 'pic') String userPic,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'like_count') int likeCount,@JsonKey(name: 'comment_count') int commentCount,@JsonKey(name: 'share_count') int shareCount
});




}
/// @nodoc
class _$FeedModelCopyWithImpl<$Res>
    implements $FeedModelCopyWith<$Res> {
  _$FeedModelCopyWithImpl(this._self, this._then);

  final FeedModel _self;
  final $Res Function(FeedModel) _then;

/// Create a copy of FeedModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? schoolId = null,Object? communityId = null,Object? spaceId = null,Object? feedText = null,Object? userName = null,Object? userPic = null,Object? createdAt = null,Object? likeCount = null,Object? commentCount = null,Object? shareCount = null,}) {
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
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FeedModel].
extension FeedModelPatterns on FeedModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeedModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeedModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeedModel value)  $default,){
final _that = this;
switch (_that) {
case _FeedModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeedModel value)?  $default,){
final _that = this;
switch (_that) {
case _FeedModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'school_id')  int schoolId, @JsonKey(name: 'community_id')  int communityId, @JsonKey(name: 'space_id')  int spaceId, @JsonKey(name: 'feed_txt')  String feedText, @JsonKey(name: 'name')  String userName, @JsonKey(name: 'pic')  String userPic, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'like_count')  int likeCount, @JsonKey(name: 'comment_count')  int commentCount, @JsonKey(name: 'share_count')  int shareCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedModel() when $default != null:
return $default(_that.id,_that.schoolId,_that.communityId,_that.spaceId,_that.feedText,_that.userName,_that.userPic,_that.createdAt,_that.likeCount,_that.commentCount,_that.shareCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'school_id')  int schoolId, @JsonKey(name: 'community_id')  int communityId, @JsonKey(name: 'space_id')  int spaceId, @JsonKey(name: 'feed_txt')  String feedText, @JsonKey(name: 'name')  String userName, @JsonKey(name: 'pic')  String userPic, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'like_count')  int likeCount, @JsonKey(name: 'comment_count')  int commentCount, @JsonKey(name: 'share_count')  int shareCount)  $default,) {final _that = this;
switch (_that) {
case _FeedModel():
return $default(_that.id,_that.schoolId,_that.communityId,_that.spaceId,_that.feedText,_that.userName,_that.userPic,_that.createdAt,_that.likeCount,_that.commentCount,_that.shareCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'school_id')  int schoolId, @JsonKey(name: 'community_id')  int communityId, @JsonKey(name: 'space_id')  int spaceId, @JsonKey(name: 'feed_txt')  String feedText, @JsonKey(name: 'name')  String userName, @JsonKey(name: 'pic')  String userPic, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'like_count')  int likeCount, @JsonKey(name: 'comment_count')  int commentCount, @JsonKey(name: 'share_count')  int shareCount)?  $default,) {final _that = this;
switch (_that) {
case _FeedModel() when $default != null:
return $default(_that.id,_that.schoolId,_that.communityId,_that.spaceId,_that.feedText,_that.userName,_that.userPic,_that.createdAt,_that.likeCount,_that.commentCount,_that.shareCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeedModel extends FeedModel {
  const _FeedModel({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'school_id') required this.schoolId, @JsonKey(name: 'community_id') required this.communityId, @JsonKey(name: 'space_id') required this.spaceId, @JsonKey(name: 'feed_txt') required this.feedText, @JsonKey(name: 'name') required this.userName, @JsonKey(name: 'pic') required this.userPic, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'like_count') required this.likeCount, @JsonKey(name: 'comment_count') required this.commentCount, @JsonKey(name: 'share_count') required this.shareCount}): super._();
  factory _FeedModel.fromJson(Map<String, dynamic> json) => _$FeedModelFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'school_id') final  int schoolId;
@override@JsonKey(name: 'community_id') final  int communityId;
@override@JsonKey(name: 'space_id') final  int spaceId;
@override@JsonKey(name: 'feed_txt') final  String feedText;
@override@JsonKey(name: 'name') final  String userName;
@override@JsonKey(name: 'pic') final  String userPic;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
//ENGAGEMENT FIELDS
@override@JsonKey(name: 'like_count') final  int likeCount;
@override@JsonKey(name: 'comment_count') final  int commentCount;
@override@JsonKey(name: 'share_count') final  int shareCount;

/// Create a copy of FeedModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedModelCopyWith<_FeedModel> get copyWith => __$FeedModelCopyWithImpl<_FeedModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeedModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.communityId, communityId) || other.communityId == communityId)&&(identical(other.spaceId, spaceId) || other.spaceId == spaceId)&&(identical(other.feedText, feedText) || other.feedText == feedText)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userPic, userPic) || other.userPic == userPic)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.commentCount, commentCount) || other.commentCount == commentCount)&&(identical(other.shareCount, shareCount) || other.shareCount == shareCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,schoolId,communityId,spaceId,feedText,userName,userPic,createdAt,likeCount,commentCount,shareCount);

@override
String toString() {
  return 'FeedModel(id: $id, schoolId: $schoolId, communityId: $communityId, spaceId: $spaceId, feedText: $feedText, userName: $userName, userPic: $userPic, createdAt: $createdAt, likeCount: $likeCount, commentCount: $commentCount, shareCount: $shareCount)';
}


}

/// @nodoc
abstract mixin class _$FeedModelCopyWith<$Res> implements $FeedModelCopyWith<$Res> {
  factory _$FeedModelCopyWith(_FeedModel value, $Res Function(_FeedModel) _then) = __$FeedModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'school_id') int schoolId,@JsonKey(name: 'community_id') int communityId,@JsonKey(name: 'space_id') int spaceId,@JsonKey(name: 'feed_txt') String feedText,@JsonKey(name: 'name') String userName,@JsonKey(name: 'pic') String userPic,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'like_count') int likeCount,@JsonKey(name: 'comment_count') int commentCount,@JsonKey(name: 'share_count') int shareCount
});




}
/// @nodoc
class __$FeedModelCopyWithImpl<$Res>
    implements _$FeedModelCopyWith<$Res> {
  __$FeedModelCopyWithImpl(this._self, this._then);

  final _FeedModel _self;
  final $Res Function(_FeedModel) _then;

/// Create a copy of FeedModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? schoolId = null,Object? communityId = null,Object? spaceId = null,Object? feedText = null,Object? userName = null,Object? userPic = null,Object? createdAt = null,Object? likeCount = null,Object? commentCount = null,Object? shareCount = null,}) {
  return _then(_FeedModel(
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
as int,
  ));
}


}

// dart format on
