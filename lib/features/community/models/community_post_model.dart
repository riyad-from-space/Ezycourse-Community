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
    required String content,
  });

  factory CommunityPostModel.fromJson(Map<String, dynamic> json) {
    return CommunityPostModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      feedText: json['feed_txt'] ?? '',
      fileType: json['file_type'] ?? 'text',
      files: List<String>.from(json['files'] ?? []),
      likeCount: json['like_count'] ?? 0,
      commentCount: json['comment_count'] ?? 0,
      shareCount: json['share_count'] ?? 0,
      createdAt: json['created_at'] ?? '',
      feedPrivacy: json['feed_privacy'] ?? 'Public',
      isBackground: json['is_background'] == 1,
      bgColor: json['bg_color'],
      user: PostUserModel.fromJson(json['user'] ?? {}),
      meta: json['meta'] ?? {},
      content: '',
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
