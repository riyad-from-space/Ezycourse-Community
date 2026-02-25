// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_file_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedFileModel {

@JsonKey(name: 'fileLoc') String get fileLoc;@JsonKey(name: 'originalName') String get fileName;@JsonKey(name: 'extname') String get fileExt;@JsonKey(name: 'type') String get fileType;
/// Create a copy of FeedFileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedFileModelCopyWith<FeedFileModel> get copyWith => _$FeedFileModelCopyWithImpl<FeedFileModel>(this as FeedFileModel, _$identity);

  /// Serializes this FeedFileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedFileModel&&(identical(other.fileLoc, fileLoc) || other.fileLoc == fileLoc)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileExt, fileExt) || other.fileExt == fileExt)&&(identical(other.fileType, fileType) || other.fileType == fileType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileLoc,fileName,fileExt,fileType);

@override
String toString() {
  return 'FeedFileModel(fileLoc: $fileLoc, fileName: $fileName, fileExt: $fileExt, fileType: $fileType)';
}


}

/// @nodoc
abstract mixin class $FeedFileModelCopyWith<$Res>  {
  factory $FeedFileModelCopyWith(FeedFileModel value, $Res Function(FeedFileModel) _then) = _$FeedFileModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'fileLoc') String fileLoc,@JsonKey(name: 'originalName') String fileName,@JsonKey(name: 'extname') String fileExt,@JsonKey(name: 'type') String fileType
});




}
/// @nodoc
class _$FeedFileModelCopyWithImpl<$Res>
    implements $FeedFileModelCopyWith<$Res> {
  _$FeedFileModelCopyWithImpl(this._self, this._then);

  final FeedFileModel _self;
  final $Res Function(FeedFileModel) _then;

/// Create a copy of FeedFileModel
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


/// Adds pattern-matching-related methods to [FeedFileModel].
extension FeedFileModelPatterns on FeedFileModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeedFileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeedFileModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeedFileModel value)  $default,){
final _that = this;
switch (_that) {
case _FeedFileModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeedFileModel value)?  $default,){
final _that = this;
switch (_that) {
case _FeedFileModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'fileLoc')  String fileLoc, @JsonKey(name: 'originalName')  String fileName, @JsonKey(name: 'extname')  String fileExt, @JsonKey(name: 'type')  String fileType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedFileModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'fileLoc')  String fileLoc, @JsonKey(name: 'originalName')  String fileName, @JsonKey(name: 'extname')  String fileExt, @JsonKey(name: 'type')  String fileType)  $default,) {final _that = this;
switch (_that) {
case _FeedFileModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'fileLoc')  String fileLoc, @JsonKey(name: 'originalName')  String fileName, @JsonKey(name: 'extname')  String fileExt, @JsonKey(name: 'type')  String fileType)?  $default,) {final _that = this;
switch (_that) {
case _FeedFileModel() when $default != null:
return $default(_that.fileLoc,_that.fileName,_that.fileExt,_that.fileType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeedFileModel extends FeedFileModel {
  const _FeedFileModel({@JsonKey(name: 'fileLoc') this.fileLoc = '', @JsonKey(name: 'originalName') this.fileName = '', @JsonKey(name: 'extname') this.fileExt = '', @JsonKey(name: 'type') this.fileType = ''}): super._();
  factory _FeedFileModel.fromJson(Map<String, dynamic> json) => _$FeedFileModelFromJson(json);

@override@JsonKey(name: 'fileLoc') final  String fileLoc;
@override@JsonKey(name: 'originalName') final  String fileName;
@override@JsonKey(name: 'extname') final  String fileExt;
@override@JsonKey(name: 'type') final  String fileType;

/// Create a copy of FeedFileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedFileModelCopyWith<_FeedFileModel> get copyWith => __$FeedFileModelCopyWithImpl<_FeedFileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeedFileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedFileModel&&(identical(other.fileLoc, fileLoc) || other.fileLoc == fileLoc)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileExt, fileExt) || other.fileExt == fileExt)&&(identical(other.fileType, fileType) || other.fileType == fileType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileLoc,fileName,fileExt,fileType);

@override
String toString() {
  return 'FeedFileModel(fileLoc: $fileLoc, fileName: $fileName, fileExt: $fileExt, fileType: $fileType)';
}


}

/// @nodoc
abstract mixin class _$FeedFileModelCopyWith<$Res> implements $FeedFileModelCopyWith<$Res> {
  factory _$FeedFileModelCopyWith(_FeedFileModel value, $Res Function(_FeedFileModel) _then) = __$FeedFileModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'fileLoc') String fileLoc,@JsonKey(name: 'originalName') String fileName,@JsonKey(name: 'extname') String fileExt,@JsonKey(name: 'type') String fileType
});




}
/// @nodoc
class __$FeedFileModelCopyWithImpl<$Res>
    implements _$FeedFileModelCopyWith<$Res> {
  __$FeedFileModelCopyWithImpl(this._self, this._then);

  final _FeedFileModel _self;
  final $Res Function(_FeedFileModel) _then;

/// Create a copy of FeedFileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileLoc = null,Object? fileName = null,Object? fileExt = null,Object? fileType = null,}) {
  return _then(_FeedFileModel(
fileLoc: null == fileLoc ? _self.fileLoc : fileLoc // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,fileExt: null == fileExt ? _self.fileExt : fileExt // ignore: cast_nullable_to_non_nullable
as String,fileType: null == fileType ? _self.fileType : fileType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
