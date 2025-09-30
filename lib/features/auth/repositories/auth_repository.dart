import 'dart:convert';

import 'package:ezycourse_community/features/auth/models/auth_login_model.dart';
import 'package:ezycourse_community/features/auth/services/network_service.dart';

class AuthRepository {
  final NetworkService _apiServices;

  AuthRepository(this._apiServices);

  Future<AuthLoginModel?> login({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> body = {'email': email, 'password': password};
    try {
      final response = await _apiServices.post(
        'student/auth/login',
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        print('Login successful');
        return AuthLoginModel.fromJson(jsonDecode(response.body));
      } else {
        print('Login failed with status: ${response.statusCode}');
        print('Error: ${response.body}');
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
