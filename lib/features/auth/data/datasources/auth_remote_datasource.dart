import 'package:ezycourse_community/features/auth/data/models/auth_login_model.dart';

abstract interface class AuthRemoteDatasource {
  Future<AuthLoginModel> login({
    required final String url,
    required final Map<String, dynamic> body,
  });
}
