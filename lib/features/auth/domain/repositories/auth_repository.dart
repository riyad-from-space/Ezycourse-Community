import 'package:ezycourse_community/features/auth/domain/entities/auth_login_entity.dart';

abstract interface class AuthRepository {
  Future<AuthLoginEntity> login({
    required final String email,
    required final String password,
  });
}
