import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';
import 'package:ezycourse_community/features/auth/data/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState {
  final bool isLoading;
  final String? token;
  final bool isAuthenticated;

  const AuthState({
    this.isLoading = false,
    this.token,
    this.isAuthenticated = false,
  });

  AuthState copyWith({bool? isLoading, String? token, bool? isAuthenticated}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      token: token ?? this.token,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}

class AuthViewmodel extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;
  final TokenStorageService _tokenStorageService = TokenStorageService();

  AuthViewmodel(this._authRepository) : super(AuthState());

  Future<void> login({required String email, required String password}) async {
    state = state.copyWith(isLoading: true);

    try {
      final result = await _authRepository.login(
        email: email,
        password: password,
      );

      final token = result.token;

      if (token.isNotEmpty) {
        await _tokenStorageService.saveToken(token);
        state = state.copyWith(
          isLoading: false,
          token: token,
          isAuthenticated: true,
        );
      }
    } catch (e) {}
  }

  Future<void> logout() async {
    await _tokenStorageService.deleteToken();
    state = AuthState();
  }
}

final authViewModelProvider = StateNotifierProvider<AuthViewmodel, AuthState>((
  ref,
) {
  return AuthViewmodel(AuthRepository(NetworkService()));
});
