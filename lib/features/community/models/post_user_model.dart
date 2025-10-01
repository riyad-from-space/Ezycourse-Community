class PostUserModel {
  final int id;
  final String fullName;
  final String profilePic;
  final String status;
  final String userType;

  PostUserModel({
    required this.id,
    required this.fullName,
    required this.profilePic,
    required this.status,
    required this.userType,
  });

  factory PostUserModel.fromJson(Map<String, dynamic> json) {
    return PostUserModel(
      id: int.tryParse(json['id']?.toString() ?? '0') ?? 0,
      fullName: json['full_name']?.toString() ?? 'Unknown User',
      profilePic:
          json['profile_pic']?.toString() ??
          'https://letcheck.b-cdn.net/human_icon.png',
      status: json['status']?.toString() ?? 'ACTIVE',
      userType: json['user_type']?.toString() ?? 'STUDENT',
    );
  }
}
