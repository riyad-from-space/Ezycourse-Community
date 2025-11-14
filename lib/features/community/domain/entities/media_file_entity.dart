import 'package:equatable/equatable.dart';
import 'enums.dart';

/// Entity representing a media file (image, video, document, etc.)
class MediaFileEntity extends Equatable {
  final String fileLoc;
  final String originalName;
  final String extname;
  final int size;
  final MediaType type;
  final String? playLink;
  final String? hlsLink;
  final String? thumbnailLink;
  final String? videoId;

  const MediaFileEntity({
    required this.fileLoc,
    required this.originalName,
    required this.extname,
    required this.size,
    required this.type,
    this.playLink,
    this.hlsLink,
    this.thumbnailLink,
    this.videoId,
  });

  /// Check if this is an image file
  bool get isImage => type == MediaType.image;

  /// Check if this is a video file
  bool get isVideo => type == MediaType.video;

  /// Check if this is a document file
  bool get isDocument => type == MediaType.document;

  /// Get the display URL (prioritize thumbnail for videos, fileLoc for images)
  String get displayUrl {
    if (isVideo && thumbnailLink != null) {
      return thumbnailLink!;
    }
    return fileLoc;
  }

  /// Get the playable URL for videos
  String? get playableUrl {
    if (isVideo) {
      return playLink ?? hlsLink;
    }
    return null;
  }

  @override
  List<Object?> get props => [
        fileLoc,
        originalName,
        extname,
        size,
        type,
        playLink,
        hlsLink,
        thumbnailLink,
        videoId,
      ];
}
