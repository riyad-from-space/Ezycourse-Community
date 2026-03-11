import 'package:ezycourse_community/app/di/injection.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';
import 'package:ezycourse_community/features/user_profile/domain/entities/user_profile_entity.dart';
import 'package:ezycourse_community/features/user_profile/domain/usecasaes/user_profile_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfileState {
  final bool isLoading;
  final String? errorMessage;
  final UserProfileEntity? userProfile;
  final bool hasFetched;

  const UserProfileState({
    this.isLoading = false,
    this.errorMessage,
    this.userProfile,
    this.hasFetched = false,
  });

  UserProfileState copyWith({
    bool? isLoading,
    String? errorMessage,
    UserProfileEntity? userProfile,
    bool? hasFetched,
    bool clearError = false,
  }) {
    return UserProfileState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      userProfile: userProfile ?? this.userProfile,
      hasFetched: hasFetched ?? this.hasFetched,
    );
  }
}

class UserProfileViewModel extends StateNotifier<UserProfileState> {
  final UserProfileUsecase _useCase;
  final TokenStorageService _tokenStorageService;

  UserProfileViewModel(this._useCase, this._tokenStorageService)
      : super(const UserProfileState());

  void resetProfile() {
    state = const UserProfileState();
  }

  Future<void> fetchUserProfile() async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final token = await _tokenStorageService.getToken();

      if (token == null || token.isEmpty) {
        throw Exception('No authentication token found');
      }

      final userProfile = await _useCase.call(
        UserProfileUseCaseParam(token: token),
      );

      state = state.copyWith(
        isLoading: false,
        userProfile: userProfile,
        hasFetched: true,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
        hasFetched: true,
      );
    }
  }
}

final userProfileViewModelProvider =
    StateNotifierProvider<UserProfileViewModel, UserProfileState>((
  ref,
) {
  return UserProfileViewModel(
    serviceLocator<UserProfileUsecase>(),
    serviceLocator<TokenStorageService>(),
  );
});
