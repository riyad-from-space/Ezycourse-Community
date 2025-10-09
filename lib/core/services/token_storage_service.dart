import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorageService {
  static const _storage = FlutterSecureStorage();
  static const _tokenKey = 'auth_token';

  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }

  Future<bool> hasToken() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  Future<void> saveCredentials(
    String email,
    String password,
    bool rememberMe,
  ) async {
    if (rememberMe) {
      await _storage.write(key: 'pass', value: password);
      await _storage.write(key: 'emailKey', value: email);
      await _storage.write(key: 'rememberMe', value: rememberMe.toString());
    } else {
      await _storage.delete(key: 'pass');
      await _storage.delete(key: 'emailKey');
      await _storage.delete(key: 'rememberMe');
    }
  }

  Future<Map<String, String?>> getCredentials() async {
    final email = await _storage.read(key: 'emailKey');
    final password = await _storage.read(key: 'pass');
    final rememberMeStr = await _storage.read(key: 'rememberMe');
    final rememberMe = rememberMeStr == 'true';

    return {
      'email': email,
      'password': password,
      'rememberMe': rememberMe.toString(),
    };
  }
}
