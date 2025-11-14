import 'package:equatable/equatable.dart';
import 'enums.dart';

/// Entity representing a user in the community
class UserEntity extends Equatable {
  final int id;
  final String fullName;
  final String profilePic;
  final bool isPrivateChat;
  final String status;
  final UserType userType;
  final DateTime? expireDate;
  final DateTime? pauseDate;
  final Map<String, dynamic> meta;

  const UserEntity({
    required this.id,
    required this.fullName,
    required this.profilePic,
    required this.isPrivateChat,
    required this.status,
    required this.userType,
    this.expireDate,
    this.pauseDate,
    required this.meta,
  });

  /// Check if user is active
  bool get isActive => status.toUpperCase() == 'ACTIVE';

  /// Check if user is a student
  bool get isStudent => userType == UserType.student;

  /// Check if user is an instructor
  bool get isInstructor => userType == UserType.instructor;

  /// Check if user is an admin
  bool get isAdmin => userType == UserType.admin;

  /// Get user initials for avatar placeholder
  String get initials {
    final names = fullName.trim().split(' ');
    if (names.isEmpty) return '?';
    if (names.length == 1) return names[0][0].toUpperCase();
    return '${names[0][0]}${names[names.length - 1][0]}'.toUpperCase();
  }

  @override
  List<Object?> get props => [
        id,
        fullName,
        profilePic,
        isPrivateChat,
        status,
        userType,
        expireDate,
        pauseDate,
        meta,
      ];
}
