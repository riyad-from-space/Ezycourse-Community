import 'package:ezycourse_community/core/constants/api.dart';
import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';
import 'package:ezycourse_community/features/community/data/repositories/community_channel_repository.dart';
import 'package:ezycourse_community/features/community/domain/entities/community_channel_entity.dart';
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
  final TokenStorageService tokenStorageService = TokenStorageService();
  final CommunityChannelRepository communityChannelRepository;
  CommunityChannelViewmodel(this.communityChannelRepository)
    : super(const CommunityChannelState());

  void resetChannel() {
    state = const CommunityChannelState();
  }

  Future<void> fetchCommunityChannels({required int communityId}) async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final token = await tokenStorageService.getToken();
      final communityChannelUrl = ApiEndpoints.channelList(communityId);
      final channels = await communityChannelRepository.fetchCommunityChannels(
        url: communityChannelUrl,
        token: token!,
      );

      state = state.copyWith(isLoading: false, channels: channels);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

}

/// Provider - AutoDispose to clear state when screen is disposed
final communityChannelViewmodelProvider = StateNotifierProvider.autoDispose<CommunityChannelViewmodel, CommunityChannelState>((ref){
  return CommunityChannelViewmodel(CommunityChannelRepository(NetworkService()));
});