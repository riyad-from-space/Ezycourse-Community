import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';
import 'package:ezycourse_community/features/auth/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState {
  final bool isLoading;
  final String? errorMessage;
  final String? token;
  final bool isAuthenticated;

  const AuthState({
    this.isLoading = false,
    this.errorMessage,
    this.token,
    this.isAuthenticated = false,
  });

  AuthState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? token,
    bool? isAuthenticated,
    bool clearError = false,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      token: token ?? this.token,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}

class AuthViewModel extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;
  final TokenStorageService _tokenStorageService = TokenStorageService();

  AuthViewModel(this._authRepository) : super(const AuthState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final result = await _authRepository.login(
        email: email,
        password: password,
      );

      if (result.token.isNotEmpty) {
        await _tokenStorageService.saveToken(result.token);
        state = state.copyWith(
          isLoading: false,
          token: result.token,
          isAuthenticated: true,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          errorMessage: 'Login failed: No token received',
        );
      }
    } on NetworkException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.message);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'An unexpected error occurred: $e',
      );
    }
  }

  void clearError() {
    state = state.copyWith(clearError: true);
  }

  Future<void> logout() async {
    await _tokenStorageService.deleteToken();
    state = const AuthState();
  }
}

// Modern Provider (not legacy)
final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>((
  ref,
) {
  final authRepository = AuthRepository(
    NetworkService(baseUrl: 'https://ezyappteam.ezycourse.com/api/app/'),
  );
  return AuthViewModel(authRepository);
});
