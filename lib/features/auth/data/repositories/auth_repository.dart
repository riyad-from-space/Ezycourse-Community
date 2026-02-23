import 'package:ezycourse_community/core/constants/api.dart';
import 'package:ezycourse_community/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ezycourse_community/features/auth/domain/entities/auth_login_entity.dart';
import 'package:ezycourse_community/features/auth/domain/repositories/auth_repository.dart'
    as domain;

class AuthRepositoryImpl implements domain.AuthRepository {
  final AuthRemoteDatasource _remoteDatasource;

  AuthRepositoryImpl(this._remoteDatasource);

  @override
  Future<AuthLoginEntity> login({
    required String email,
    required String password,
  }) async {
    final url = ApiEndpoints.login;
    final body = {'email': email, 'password': password};

    final model = await _remoteDatasource.login(url: url, body: body);
    return model.toEntity();
  }
}
