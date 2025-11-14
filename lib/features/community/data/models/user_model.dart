import '../../domain/entities/enums.dart';
import '../../domain/entities/user_entity.dart';

/// Model for parsing user JSON and converting to UserEntity
class UserModel {
  final int id;
  final String fullName;
  final String profilePic;
  final int isPrivateChat;
  final String? expireDate;
  final String status;
  final String? pauseDate;
  final String userType;
  final Map<String, dynamic> meta;

  UserModel({
    required this.id,
    required this.fullName,
    required this.profilePic,
    required this.isPrivateChat,
    this.expireDate,
    required this.status,
    this.pauseDate,
    required this.userType,
    required this.meta,
  });

  /// Parse from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      fullName: json['full_name'] ?? '',
      profilePic: json['profile_pic'] ?? '',
      isPrivateChat: json['is_private_chat'] ?? 0,
      expireDate: json['expire_date'],
      status: json['status'] ?? 'ACTIVE',
      pauseDate: json['pause_date'],
      userType: json['user_type'] ?? 'STUDENT',
      meta: json['meta'] ?? {},
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'profile_pic': profilePic,
      'is_private_chat': isPrivateChat,
      'expire_date': expireDate,
      'status': status,
      'pause_date': pauseDate,
      'user_type': userType,
      'meta': meta,
    };
  }

  /// Convert to domain entity
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      fullName: fullName,
      profilePic: profilePic,
      isPrivateChat: isPrivateChat == 1,
      status: status,
      userType: UserType.fromString(userType),
      expireDate: expireDate != null ? DateTime.tryParse(expireDate!) : null,
      pauseDate: pauseDate != null ? DateTime.tryParse(pauseDate!) : null,
      meta: meta,
    );
  }

  /// Convert from domain entity
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      fullName: entity.fullName,
      profilePic: entity.profilePic,
      isPrivateChat: entity.isPrivateChat ? 1 : 0,
      status: entity.status,
      userType: entity.userType.name.toUpperCase(),
      expireDate: entity.expireDate?.toIso8601String(),
      pauseDate: entity.pauseDate?.toIso8601String(),
      meta: entity.meta,
    );
  }
}
