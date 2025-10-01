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
      id: json['id'] ?? 0,
      fullName: json['full_name'] ?? 'Unknown User',
      profilePic:
          json['profile_pic'] ?? 'https://letcheck.b-cdn.net/human_icon.png',
      status: json['status'] ?? 'ACTIVE',
      userType: json['user_type'] ?? 'STUDENT',
    );
  }
}
