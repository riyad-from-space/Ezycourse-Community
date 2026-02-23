import 'package:ezycourse_community/app/di/injection.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';
import 'package:ezycourse_community/features/auth/data/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState {
  final bool isLoading;
  final String? token;
  final bool isAuthenticated;
  final String? errorMessage;

  const AuthState({
    this.isLoading = false,
    this.token,
    this.isAuthenticated = false,
    this.errorMessage,
  });

  AuthState copyWith({
    bool? isLoading,
    String? token,
    bool? isAuthenticated,
    String? errorMessage,
    bool clearError = false,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      token: token ?? this.token,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}

class AuthViewmodel extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;
  final TokenStorageService _tokenStorageService;

  AuthViewmodel(this._authRepository, this._tokenStorageService)
      : super(const AuthState());

  Future<void> login({required String email, required String password}) async {
    state = state.copyWith(isLoading: true, clearError: true);

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
      } else {
        state = state.copyWith(
          isLoading: false,
          errorMessage: 'Invalid token received',
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> logout() async {
    await _tokenStorageService.deleteToken();
    state = const AuthState();
  }
}

final authViewModelProvider = StateNotifierProvider<AuthViewmodel, AuthState>((
  ref,
) {
  return AuthViewmodel(
    serviceLocator<AuthRepository>(),
    serviceLocator<TokenStorageService>(),
  );
});
