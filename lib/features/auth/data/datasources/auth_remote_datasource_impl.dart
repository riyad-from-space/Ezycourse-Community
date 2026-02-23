import 'dart:convert';

import 'package:ezycourse_community/core/errors/app_exception.dart';
import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ezycourse_community/features/auth/data/models/auth_login_model.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final NetworkService networkService;
  AuthRemoteDatasourceImpl(this.networkService);

  @override
  Future<AuthLoginModel> login({
    required final String url,
    required final Map<String, dynamic> body,
  }) async {
    final response = await networkService.post(body: body, url: url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return AuthLoginModel.fromJson(jsonData);
    } else {
      final error = jsonDecode(response.body);
      final message = error['message'] ?? 'Login failed';
      throw AppException(message, statusCode: response.statusCode);
    }
  }
}
