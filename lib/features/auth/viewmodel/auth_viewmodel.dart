import 'package:ezycourse_community/features/auth/repositories/auth_repository.dart';
import 'package:ezycourse_community/features/auth/services/network_service.dart';
import 'package:flutter_riverpod/legacy.dart';

class AuthState {
  final bool isLoading;
  final String? errorMessage;
  final String? token;
  AuthState({this.isLoading = false, this.errorMessage, this.token});

  AuthState copyWith({bool? isLoading, String? errorMessage, String? token}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      token: token ?? this.token,
    );
  }
}

class AuthViewmodel extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;
  AuthViewmodel(this._authRepository) : super(AuthState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    final result = await _authRepository.login(
      email: email,
      password: password,
    );
    if (result != null && result.token.isNotEmpty) {
      state = state.copyWith(isLoading: false, token: result.token);
    } else {
      state = state.copyWith(isLoading: false);
    }
  }
}

final authViewModelProvider = StateNotifierProvider<AuthViewmodel, AuthState>((
  ref,
) {
  final authRepository = AuthRepository(
    NetworkService(baseUrl: 'https://ezyappteam.ezycourse.com/api/app/'),
  );
  return AuthViewmodel(authRepository);
});
