import 'package:ezycourse_community/features/auth/domain/entities/auth_login_entity.dart';
import 'package:ezycourse_community/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  const LoginUseCase(this.repository);

  final AuthRepository repository;

  Future<AuthLoginEntity> call(final LoginUseCaseParams params) {
    return repository.login(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginUseCaseParams {
  LoginUseCaseParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
