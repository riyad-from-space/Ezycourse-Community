// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_file_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FeedFileEntity {

 String get fileLoc; String get fileName; String get fileExt; String get fileType;
/// Create a copy of FeedFileEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedFileEntityCopyWith<FeedFileEntity> get copyWith => _$FeedFileEntityCopyWithImpl<FeedFileEntity>(this as FeedFileEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedFileEntity&&(identical(other.fileLoc, fileLoc) || other.fileLoc == fileLoc)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileExt, fileExt) || other.fileExt == fileExt)&&(identical(other.fileType, fileType) || other.fileType == fileType));
}


@override
int get hashCode => Object.hash(runtimeType,fileLoc,fileName,fileExt,fileType);

@override
String toString() {
  return 'FeedFileEntity(fileLoc: $fileLoc, fileName: $fileName, fileExt: $fileExt, fileType: $fileType)';
}


}

/// @nodoc
abstract mixin class $FeedFileEntityCopyWith<$Res>  {
  factory $FeedFileEntityCopyWith(FeedFileEntity value, $Res Function(FeedFileEntity) _then) = _$FeedFileEntityCopyWithImpl;
@useResult
$Res call({
 String fileLoc, String fileName, String fileExt, String fileType
});




}
/// @nodoc
class _$FeedFileEntityCopyWithImpl<$Res>
    implements $FeedFileEntityCopyWith<$Res> {
  _$FeedFileEntityCopyWithImpl(this._self, this._then);

  final FeedFileEntity _self;
  final $Res Function(FeedFileEntity) _then;

/// Create a copy of FeedFileEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileLoc = null,Object? fileName = null,Object? fileExt = null,Object? fileType = null,}) {
  return _then(_self.copyWith(
fileLoc: null == fileLoc ? _self.fileLoc : fileLoc // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,fileExt: null == fileExt ? _self.fileExt : fileExt // ignore: cast_nullable_to_non_nullable
as String,fileType: null == fileType ? _self.fileType : fileType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FeedFileEntity].
extension FeedFileEntityPatterns on FeedFileEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeedFileEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeedFileEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeedFileEntity value)  $default,){
final _that = this;
switch (_that) {
case _FeedFileEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeedFileEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FeedFileEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fileLoc,  String fileName,  String fileExt,  String fileType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedFileEntity() when $default != null:
return $default(_that.fileLoc,_that.fileName,_that.fileExt,_that.fileType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fileLoc,  String fileName,  String fileExt,  String fileType)  $default,) {final _that = this;
switch (_that) {
case _FeedFileEntity():
return $default(_that.fileLoc,_that.fileName,_that.fileExt,_that.fileType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fileLoc,  String fileName,  String fileExt,  String fileType)?  $default,) {final _that = this;
switch (_that) {
case _FeedFileEntity() when $default != null:
return $default(_that.fileLoc,_that.fileName,_that.fileExt,_that.fileType);case _:
  return null;

}
}

}

/// @nodoc


class _FeedFileEntity implements FeedFileEntity {
  const _FeedFileEntity({required this.fileLoc, required this.fileName, required this.fileExt, required this.fileType});
  

@override final  String fileLoc;
@override final  String fileName;
@override final  String fileExt;
@override final  String fileType;

/// Create a copy of FeedFileEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedFileEntityCopyWith<_FeedFileEntity> get copyWith => __$FeedFileEntityCopyWithImpl<_FeedFileEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedFileEntity&&(identical(other.fileLoc, fileLoc) || other.fileLoc == fileLoc)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileExt, fileExt) || other.fileExt == fileExt)&&(identical(other.fileType, fileType) || other.fileType == fileType));
}


@override
int get hashCode => Object.hash(runtimeType,fileLoc,fileName,fileExt,fileType);

@override
String toString() {
  return 'FeedFileEntity(fileLoc: $fileLoc, fileName: $fileName, fileExt: $fileExt, fileType: $fileType)';
}


}

/// @nodoc
abstract mixin class _$FeedFileEntityCopyWith<$Res> implements $FeedFileEntityCopyWith<$Res> {
  factory _$FeedFileEntityCopyWith(_FeedFileEntity value, $Res Function(_FeedFileEntity) _then) = __$FeedFileEntityCopyWithImpl;
@override @useResult
$Res call({
 String fileLoc, String fileName, String fileExt, String fileType
});




}
/// @nodoc
class __$FeedFileEntityCopyWithImpl<$Res>
    implements _$FeedFileEntityCopyWith<$Res> {
  __$FeedFileEntityCopyWithImpl(this._self, this._then);

  final _FeedFileEntity _self;
  final $Res Function(_FeedFileEntity) _then;

/// Create a copy of FeedFileEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileLoc = null,Object? fileName = null,Object? fileExt = null,Object? fileType = null,}) {
  return _then(_FeedFileEntity(
fileLoc: null == fileLoc ? _self.fileLoc : fileLoc // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,fileExt: null == fileExt ? _self.fileExt : fileExt // ignore: cast_nullable_to_non_nullable
as String,fileType: null == fileType ? _self.fileType : fileType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
