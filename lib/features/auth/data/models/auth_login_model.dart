import 'package:ezycourse_community/features/auth/domain/entities/auth_login_entity.dart';

class AuthLoginModel {
  final String token;

  AuthLoginModel({required this.token});

  factory AuthLoginModel.fromJson(Map<String, dynamic> json) {
    return AuthLoginModel(token: json['token'] ?? '');
  }

  AuthLoginEntity toEntity() {
    return AuthLoginEntity(token: token);
  }
}
