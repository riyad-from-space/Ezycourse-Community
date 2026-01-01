import 'dart:convert';

import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/features/auth/data/models/auth_login_model.dart';

class AuthRepository {
  final NetworkService _networkService;

  AuthRepository(this._networkService);

  Future<AuthLoginModel> login({
    required String email,
    required String password,
  }) async {
    final body = {'email': email, 'password': password};

    final response = await _networkService.post(
      '/student/auth/login',
      body: body,
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return AuthLoginModel.fromJson(jsonData);
    } else {
      final error = jsonDecode(response.body);
      final message = error['message'] ?? 'Login failed';
      throw NetworkException(message, response.statusCode);
    }
  }
}
