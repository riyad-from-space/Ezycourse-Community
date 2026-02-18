import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';
import 'package:ezycourse_community/features/community/data/datasources/community_remote_datasource_impl.dart';
import 'package:ezycourse_community/features/community/data/repositories/community_list_repository_impl.dart';
import 'package:ezycourse_community/features/community/domain/entities/community_list_entity.dart';
import 'package:ezycourse_community/features/community/domain/usecases/community_list_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// State for feed list
class CommunityListState {
  final bool isLoading;
  final String? errorMessage;
  final List<CommunityListEntity> communityList;
  final bool hasMoreData;
  final int currentPage;

  const CommunityListState({
    this.isLoading = false,
    this.errorMessage,
    this.communityList = const [],
    this.hasMoreData = false,
    this.currentPage = 1,
  });

  CommunityListState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<CommunityListEntity>? communityList,
    bool clearError = false,
    int? currentPage,
    bool? hasMoreData,
  }) {
    return CommunityListState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      communityList: communityList ?? this.communityList,
      hasMoreData: hasMoreData ?? this.hasMoreData,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}

/// ViewModel for managing feed list state
class CommunityListViewModel extends StateNotifier<CommunityListState> {
  final GetEnrolledCommunityUseCase _useCase;
  final TokenStorageService _tokenStorageService = TokenStorageService();

  static const int _pageSize = 10;

  CommunityListViewModel(this._useCase) : super(const CommunityListState());

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

      final communities = await _useCase.call(
        GetEnrolledCommunityUseCaseParam(
          token: token,
          page: state.currentPage,
          limit: _pageSize,
        ),
      );

      // Update state with new communities
      state = state.copyWith(
        hasMoreData: communities.isNotEmpty,
        currentPage: state.currentPage + 1,
        isLoading: false,
        communityList: [...state.communityList, ...communities],
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> refreshCommunityList() async {
    state = const CommunityListState(currentPage: 1, hasMoreData: true);

    await fetchCommunityList();
  }
}

/// Provider for CommunityListViewModel
final communityListViewModelProvider =
    StateNotifierProvider.autoDispose<
      CommunityListViewModel,
      CommunityListState
    >((ref) {
      return CommunityListViewModel(
        GetEnrolledCommunityUseCase(
          CommunityListRepositoryImpl(
            CommunityRemoteDatasourceImpl(NetworkService()),
          ),
        ),
      );
    });
