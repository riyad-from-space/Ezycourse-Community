import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';
import 'package:ezycourse_community/features/community/models/community_post_model.dart';
import 'package:ezycourse_community/features/community/repositories/community_repository.dart';
import 'package:flutter_riverpod/legacy.dart';

class CommunityState {
  final bool isLoading;
  final String? errorMessage;
  final List<CommunityPostModel> posts;
  final bool hasError;
  final int spaceId;
  final int communityId;
  CommunityState({
    this.isLoading = false,
    this.errorMessage,
    this.posts = const [],
    this.hasError = false,
    this.spaceId = 5883,
    this.communityId = 2914,
  });
  CommunityState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<CommunityPostModel>? posts,
    bool? hasError,
    bool clearError = false,
    int? spaceId,
    int? communityId,
  }) {
    return CommunityState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      posts: posts ?? this.posts,
      hasError: hasError ?? this.hasError,
      spaceId: spaceId ?? this.spaceId,
      communityId: communityId ?? this.communityId,
    );
  }
}

class CommunityViewModel extends StateNotifier<CommunityState> {
  final CommunityRepository _communityRepository;
  final TokenStorageService _tokenStorageService;
  CommunityViewModel(this._communityRepository, this._tokenStorageService)
    : super(CommunityState());

  Future<void> fetchPosts() async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final token = await _tokenStorageService.getToken();
      if (token == null) {
        state = state.copyWith(
          isLoading: false,
          hasError: true,
          errorMessage: 'Authentication token not found',
        );
        return;
      }
      final posts = await _communityRepository.fetchPosts(
        token: token,
        communityId: state.communityId,
        spaceId: state.spaceId,
      );
      state = state.copyWith(isLoading: false, posts: posts, hasError: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: e.toString(),
      );
    }
  }
}

final communityViewModelProvider =
    StateNotifierProvider<CommunityViewModel, CommunityState>((ref) {
      final repository = CommunityRepository(
        NetworkService(baseUrl: 'https://ezyappteam.ezycourse.com/api/app/'),
      );

      final tokenStorage = TokenStorageService();

      return CommunityViewModel(repository, tokenStorage);
    });
