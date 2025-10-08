import 'dart:convert';

import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/features/auth/models/auth_login_model.dart';

class AuthRepository {
  final NetworkService _apiServices;

  AuthRepository(this._apiServices);

  Future<AuthLoginModel> login({
    required String email,
    required String password,
  }) async {
    final body = {'email': email, 'password': password};

    final response = await _apiServices.post(
      'student/auth/login',
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return AuthLoginModel.fromJson(jsonData);
    } else if (response.statusCode == 401) {
      throw NetworkException('Invalid email or password', 401);
    } else if (response.statusCode == 422) {
      final error = jsonDecode(response.body);
      final message = error['message'] ?? 'Validation error';
      throw NetworkException(message, 422);
    } else if (response.statusCode >= 500) {
      throw NetworkException(
        'Server error. Please try again later',
        response.statusCode,
      );
    } else {
      final error = jsonDecode(response.body);
      final message = error['message'] ?? 'Login failed';
      throw NetworkException(message, response.statusCode);
    }
  }
}
