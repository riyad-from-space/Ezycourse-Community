import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';
import 'package:ezycourse_community/features/community/data/repositories/community_list_repository.dart';
import 'package:ezycourse_community/features/community/domain/entities/community_list_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// State for feed list
class CommunityListState {
  final bool isLoading;
  final String? errorMessage;
  final List<CommunityListEntity> communityList;

  const CommunityListState({
    this.isLoading = false,
    this.errorMessage,
    this.communityList = const [],
  });

  CommunityListState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<CommunityListEntity>? communityList,
    bool clearError = false,
  }) {
    return CommunityListState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      communityList: communityList ?? this.communityList,
    );
  }
}

/// ViewModel for managing feed list state
class CommunityListViewModel extends StateNotifier<CommunityListState> {
  final CommunityListRepository _repository;
  final TokenStorageService _tokenStorageService = TokenStorageService();

  CommunityListViewModel(this._repository) : super(const CommunityListState());

  /// Fetch community list from API
  Future<void> fetchCommunityList() async {
    // Don't fetch if already loading
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final token = await _tokenStorageService.getToken();

      if (token == null || token.isEmpty) {
        throw Exception('No authentication token found');
      }

      final newCommunityList = await _repository.getCommunityList(token: token);

      // Update state with new feeds
      state = state.copyWith(isLoading: false, communityList: newCommunityList);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}

/// Provider for FeedViewModel
final communityListViewModelProvider =
    StateNotifierProvider<CommunityListViewModel, CommunityListState>((ref) {
      return CommunityListViewModel(CommunityListRepository(NetworkService()));
    });
