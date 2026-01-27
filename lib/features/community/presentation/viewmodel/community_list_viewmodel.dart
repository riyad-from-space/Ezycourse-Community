import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';
import 'package:ezycourse_community/core/shared/models/pagination_meta_model.dart';
import 'package:ezycourse_community/features/community/data/repositories/community_list_repository.dart';
import 'package:ezycourse_community/features/community/domain/entities/community_list_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// State for feed list
class CommunityListState {
  final bool isLoading;
  final bool isLoadingMore;
  final String? errorMessage;
  final List<CommunityListEntity> communityList;
  final MetaModel? meta;
  final bool hasMoreData;
  final int currentPage;

  const CommunityListState({
    this.isLoading = false,
    this.errorMessage,
    this.communityList = const [],
    this.meta,
    this.currentPage = 1,
    this.isLoadingMore = false,
    this.hasMoreData = false,
  });

  CommunityListState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<CommunityListEntity>? communityList,
    MetaModel? meta,
    bool clearError = false,
    int? currentPage,
    bool? isLoadingMore,
    bool? hasMoreData,
  }) {
    return CommunityListState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      communityList: communityList ?? this.communityList,
      meta: meta ?? this.meta,
      currentPage: currentPage ?? this.currentPage,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMoreData: hasMoreData ?? this.hasMoreData,
    );
  }
}

/// ViewModel for managing feed list state
class CommunityListViewModel extends StateNotifier<CommunityListState> {
  final CommunityListRepository _repository;
  final TokenStorageService _tokenStorageService = TokenStorageService();

  static const int _pageSize = 10;

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

      final newCommunityList = await _repository.getCommunityList(
        page: state.currentPage,
        limit: _pageSize,
        token: token,
      );

      final communities = newCommunityList.data
          .map((e) => e.toEntity())
          .toList();

      // Update state with new feeds
      state = state.copyWith(
        isLoading: false,
        communityList: [...state.communityList, ...communities],

        currentPage: state.currentPage + 1,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  // Future<void> refreshCommunityList() async {
  //   await fetchCommunityList(has);
  // }
}

/// Provider for FeedViewModel
final communityListViewModelProvider =
    StateNotifierProvider.autoDispose<
      CommunityListViewModel,
      CommunityListState
    >((ref) {
      return CommunityListViewModel(CommunityListRepository(NetworkService()));
    });
