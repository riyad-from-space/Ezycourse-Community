import 'package:ezycourse_community/app/di/injection.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';
import 'package:ezycourse_community/features/community/domain/entities/community_channel_entity.dart';
import 'package:ezycourse_community/features/community/domain/usecases/get_community_channels_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommunityChannelState {
  final bool isLoading;
  final String? errorMessage;
  final List<CommunityChannelEntity> channels;

  const CommunityChannelState({
    this.isLoading = false,
    this.errorMessage,
    this.channels = const [],
  });

  CommunityChannelState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<CommunityChannelEntity>? channels,
    bool clearError = false,
  }) {
    return CommunityChannelState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      channels: channels ?? this.channels,
    );
  }
}

class CommunityChannelViewmodel extends StateNotifier<CommunityChannelState> {
  final TokenStorageService _tokenStorageService;
  final GetCommunityChannelsUseCase _useCase;

  CommunityChannelViewmodel(this._useCase, this._tokenStorageService)
    : super(const CommunityChannelState());

  void resetChannel() {
    state = const CommunityChannelState();
  }

  Future<void> fetchCommunityChannels({required int communityId}) async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final token = await _tokenStorageService.getToken();

      if (token == null || token.isEmpty) {
        throw Exception('No authentication token found');
      }

      final channels = await _useCase.call(
        GetCommunityChannelsUseCaseParams(
          token: token,
          communityId: communityId,
        ),
      );

      state = state.copyWith(isLoading: false, channels: channels);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}

/// Provider - AutoDispose to clear state when screen is disposed
final communityChannelViewmodelProvider = StateNotifierProvider.autoDispose<
    CommunityChannelViewmodel, CommunityChannelState>((ref) {
  return CommunityChannelViewmodel(
    serviceLocator<GetCommunityChannelsUseCase>(),
    serviceLocator<TokenStorageService>(),
  );
});
