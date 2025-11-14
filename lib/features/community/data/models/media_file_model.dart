import '../../domain/entities/enums.dart';
import '../../domain/entities/media_file_entity.dart';

/// Model for parsing media file JSON and converting to MediaFileEntity
class MediaFileModel {
  final String? playLink;
  final String? hlsLink;
  final String? thumbnailLink;
  final String fileLoc;
  final String originalName;
  final String extname;
  final int size;
  final String type;
  final String? videoId;

  MediaFileModel({
    this.playLink,
    this.hlsLink,
    this.thumbnailLink,
    required this.fileLoc,
    required this.originalName,
    required this.extname,
    required this.size,
    required this.type,
    this.videoId,
  });

  /// Parse from JSON
  factory MediaFileModel.fromJson(Map<String, dynamic> json) {
    return MediaFileModel(
      playLink: json['play_link'],
      hlsLink: json['hls_link'],
      thumbnailLink: json['thumbnail_link'],
      fileLoc: json['fileLoc'] ?? '',
      originalName: json['originalName'] ?? '',
      extname: json['extname'] ?? '',
      size: json['size'] ?? 0,
      type: json['type'] ?? 'image',
      videoId: json['videoID'],
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'play_link': playLink,
      'hls_link': hlsLink,
      'thumbnail_link': thumbnailLink,
      'fileLoc': fileLoc,
      'originalName': originalName,
      'extname': extname,
      'size': size,
      'type': type,
      'videoID': videoId,
    };
  }

  /// Convert to domain entity
  MediaFileEntity toEntity() {
    return MediaFileEntity(
      fileLoc: fileLoc,
      originalName: originalName,
      extname: extname,
      size: size,
      type: MediaType.fromString(type),
      playLink: playLink,
      hlsLink: hlsLink,
      thumbnailLink: thumbnailLink,
      videoId: videoId,
    );
  }

  /// Convert from domain entity
  factory MediaFileModel.fromEntity(MediaFileEntity entity) {
    return MediaFileModel(
      fileLoc: entity.fileLoc,
      originalName: entity.originalName,
      extname: entity.extname,
      size: entity.size,
      type: entity.type.name,
      playLink: entity.playLink,
      hlsLink: entity.hlsLink,
      thumbnailLink: entity.thumbnailLink,
      videoId: entity.videoId,
    );
  }
}
