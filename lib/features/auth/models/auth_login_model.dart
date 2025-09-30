class AuthLoginModel {
  final String token;

  AuthLoginModel({required this.token});

  factory AuthLoginModel.fromJson(Map<String, dynamic> json) {
    return AuthLoginModel(token: json['token'] ?? '');
  }
}
