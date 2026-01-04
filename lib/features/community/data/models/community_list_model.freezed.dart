// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommunityListModel {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'title') String get title;@JsonKey(name: 'cover') String get coverImage;@JsonKey(name: 'total_feeds') int get totalFeeds;@JsonKey(name: 'total_members') int get totalMembers;@JsonKey(name: 'status') String get status;@JsonKey(name: 'thumbnail') String get thumbnail;
/// Create a copy of CommunityListModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommunityListModelCopyWith<CommunityListModel> get copyWith => _$CommunityListModelCopyWithImpl<CommunityListModel>(this as CommunityListModel, _$identity);

  /// Serializes this CommunityListModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommunityListModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverImage, coverImage) || other.coverImage == coverImage)&&(identical(other.totalFeeds, totalFeeds) || other.totalFeeds == totalFeeds)&&(identical(other.totalMembers, totalMembers) || other.totalMembers == totalMembers)&&(identical(other.status, status) || other.status == status)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,coverImage,totalFeeds,totalMembers,status,thumbnail);

@override
String toString() {
  return 'CommunityListModel(id: $id, title: $title, coverImage: $coverImage, totalFeeds: $totalFeeds, totalMembers: $totalMembers, status: $status, thumbnail: $thumbnail)';
}


}

/// @nodoc
abstract mixin class $CommunityListModelCopyWith<$Res>  {
  factory $CommunityListModelCopyWith(CommunityListModel value, $Res Function(CommunityListModel) _then) = _$CommunityListModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'title') String title,@JsonKey(name: 'cover') String coverImage,@JsonKey(name: 'total_feeds') int totalFeeds,@JsonKey(name: 'total_members') int totalMembers,@JsonKey(name: 'status') String status,@JsonKey(name: 'thumbnail') String thumbnail
});




}
/// @nodoc
class _$CommunityListModelCopyWithImpl<$Res>
    implements $CommunityListModelCopyWith<$Res> {
  _$CommunityListModelCopyWithImpl(this._self, this._then);

  final CommunityListModel _self;
  final $Res Function(CommunityListModel) _then;

/// Create a copy of CommunityListModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? coverImage = null,Object? totalFeeds = null,Object? totalMembers = null,Object? status = null,Object? thumbnail = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,coverImage: null == coverImage ? _self.coverImage : coverImage // ignore: cast_nullable_to_non_nullable
as String,totalFeeds: null == totalFeeds ? _self.totalFeeds : totalFeeds // ignore: cast_nullable_to_non_nullable
as int,totalMembers: null == totalMembers ? _self.totalMembers : totalMembers // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CommunityListModel].
extension CommunityListModelPatterns on CommunityListModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommunityListModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommunityListModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommunityListModel value)  $default,){
final _that = this;
switch (_that) {
case _CommunityListModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommunityListModel value)?  $default,){
final _that = this;
switch (_that) {
case _CommunityListModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'title')  String title, @JsonKey(name: 'cover')  String coverImage, @JsonKey(name: 'total_feeds')  int totalFeeds, @JsonKey(name: 'total_members')  int totalMembers, @JsonKey(name: 'status')  String status, @JsonKey(name: 'thumbnail')  String thumbnail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommunityListModel() when $default != null:
return $default(_that.id,_that.title,_that.coverImage,_that.totalFeeds,_that.totalMembers,_that.status,_that.thumbnail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'title')  String title, @JsonKey(name: 'cover')  String coverImage, @JsonKey(name: 'total_feeds')  int totalFeeds, @JsonKey(name: 'total_members')  int totalMembers, @JsonKey(name: 'status')  String status, @JsonKey(name: 'thumbnail')  String thumbnail)  $default,) {final _that = this;
switch (_that) {
case _CommunityListModel():
return $default(_that.id,_that.title,_that.coverImage,_that.totalFeeds,_that.totalMembers,_that.status,_that.thumbnail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'title')  String title, @JsonKey(name: 'cover')  String coverImage, @JsonKey(name: 'total_feeds')  int totalFeeds, @JsonKey(name: 'total_members')  int totalMembers, @JsonKey(name: 'status')  String status, @JsonKey(name: 'thumbnail')  String thumbnail)?  $default,) {final _that = this;
switch (_that) {
case _CommunityListModel() when $default != null:
return $default(_that.id,_that.title,_that.coverImage,_that.totalFeeds,_that.totalMembers,_that.status,_that.thumbnail);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommunityListModel extends CommunityListModel {
  const _CommunityListModel({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'title') required this.title, @JsonKey(name: 'cover') required this.coverImage, @JsonKey(name: 'total_feeds') required this.totalFeeds, @JsonKey(name: 'total_members') required this.totalMembers, @JsonKey(name: 'status') required this.status, @JsonKey(name: 'thumbnail') required this.thumbnail}): super._();
  factory _CommunityListModel.fromJson(Map<String, dynamic> json) => _$CommunityListModelFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'title') final  String title;
@override@JsonKey(name: 'cover') final  String coverImage;
@override@JsonKey(name: 'total_feeds') final  int totalFeeds;
@override@JsonKey(name: 'total_members') final  int totalMembers;
@override@JsonKey(name: 'status') final  String status;
@override@JsonKey(name: 'thumbnail') final  String thumbnail;

/// Create a copy of CommunityListModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommunityListModelCopyWith<_CommunityListModel> get copyWith => __$CommunityListModelCopyWithImpl<_CommunityListModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommunityListModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommunityListModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverImage, coverImage) || other.coverImage == coverImage)&&(identical(other.totalFeeds, totalFeeds) || other.totalFeeds == totalFeeds)&&(identical(other.totalMembers, totalMembers) || other.totalMembers == totalMembers)&&(identical(other.status, status) || other.status == status)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,coverImage,totalFeeds,totalMembers,status,thumbnail);

@override
String toString() {
  return 'CommunityListModel(id: $id, title: $title, coverImage: $coverImage, totalFeeds: $totalFeeds, totalMembers: $totalMembers, status: $status, thumbnail: $thumbnail)';
}


}

/// @nodoc
abstract mixin class _$CommunityListModelCopyWith<$Res> implements $CommunityListModelCopyWith<$Res> {
  factory _$CommunityListModelCopyWith(_CommunityListModel value, $Res Function(_CommunityListModel) _then) = __$CommunityListModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'title') String title,@JsonKey(name: 'cover') String coverImage,@JsonKey(name: 'total_feeds') int totalFeeds,@JsonKey(name: 'total_members') int totalMembers,@JsonKey(name: 'status') String status,@JsonKey(name: 'thumbnail') String thumbnail
});




}
/// @nodoc
class __$CommunityListModelCopyWithImpl<$Res>
    implements _$CommunityListModelCopyWith<$Res> {
  __$CommunityListModelCopyWithImpl(this._self, this._then);

  final _CommunityListModel _self;
  final $Res Function(_CommunityListModel) _then;

/// Create a copy of CommunityListModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? coverImage = null,Object? totalFeeds = null,Object? totalMembers = null,Object? status = null,Object? thumbnail = null,}) {
  return _then(_CommunityListModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,coverImage: null == coverImage ? _self.coverImage : coverImage // ignore: cast_nullable_to_non_nullable
as String,totalFeeds: null == totalFeeds ? _self.totalFeeds : totalFeeds // ignore: cast_nullable_to_non_nullable
as int,totalMembers: null == totalMembers ? _self.totalMembers : totalMembers // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
