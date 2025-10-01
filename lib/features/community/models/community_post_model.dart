import 'package:ezycourse_community/features/community/models/post_user_model.dart';

class CommunityPostModel {
  final int id;
  final String title;
  final String feedText;
  final String fileType;
  final List<String> files;
  final int likeCount;
  final int commentCount;
  final int shareCount;
  final String createdAt;
  final String feedPrivacy;
  final bool isBackground;
  final String? bgColor;
  final PostUserModel user;
  final Map<String, dynamic> meta;

  CommunityPostModel({
    required this.id,
    required this.title,
    required this.feedText,
    required this.fileType,
    required this.files,
    required this.likeCount,
    required this.commentCount,
    required this.shareCount,
    required this.createdAt,
    required this.feedPrivacy,
    required this.isBackground,
    this.bgColor,
    required this.user,
    required this.meta,
  });

  factory CommunityPostModel.fromJson(Map<String, dynamic> json) {
    // Safely parse files field
    List<String> parseFiles(dynamic filesData) {
      if (filesData == null) return [];

      if (filesData is List) {
        return filesData
            .map((item) {
              if (item is String) return item;
              if (item is Map) return item['url']?.toString() ?? '';
              return item.toString();
            })
            .where((item) => item.isNotEmpty)
            .toList();
      }

      if (filesData is String) return [filesData];

      return [];
    }

    return CommunityPostModel(
      id: json['id'] ?? 0,
      title: json['title']?.toString() ?? '',
      feedText: json['feed_txt']?.toString() ?? '',
      fileType: json['file_type']?.toString() ?? 'text',
      files: parseFiles(json['files']),
      likeCount: int.tryParse(json['like_count']?.toString() ?? '0') ?? 0,
      commentCount: int.tryParse(json['comment_count']?.toString() ?? '0') ?? 0,
      shareCount: int.tryParse(json['share_count']?.toString() ?? '0') ?? 0,
      createdAt: json['created_at']?.toString() ?? '',
      feedPrivacy: json['feed_privacy']?.toString() ?? 'Public',
      isBackground:
          json['is_background'] == 1 ||
          json['is_background'] == '1' ||
          json['is_background'] == true,
      bgColor: json['bg_color']?.toString(),
      user: PostUserModel.fromJson(
        json['user'] is Map<String, dynamic> ? json['user'] : {},
      ),
      meta: json['meta'] is Map<String, dynamic> ? json['meta'] : {},
    );
  }

  String getTimeAgo() {
    try {
      final dateTime = DateTime.parse(createdAt);
      final now = DateTime.now();
      final difference = now.difference(dateTime);

      if (difference.inDays > 365) {
        return '${(difference.inDays / 365).floor()}y ago';
      } else if (difference.inDays > 30) {
        return '${(difference.inDays / 30).floor()}mo ago';
      } else if (difference.inDays > 0) {
        return '${difference.inDays}d ago';
      } else if (difference.inHours > 0) {
        return '${difference.inHours}h ago';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes}m ago';
      } else {
        return 'Just now';
      }
    } catch (e) {
      return '';
    }
  }
}
