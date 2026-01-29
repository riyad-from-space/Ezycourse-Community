import 'package:ezycourse_community/core/config/api_endpoints.dart';
import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';
import 'package:ezycourse_community/features/community/data/repositories/feed_comment_repositoty.dart';
import 'package:ezycourse_community/features/community/domain/entities/feed_comment_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedCommentState {
  final bool isLoading;
  final String? errorMessage;
  final List<FeedCommentEntity> comments;

  FeedCommentState({
    this.isLoading = false,
    this.errorMessage,
    this.comments = const [],
  });

  FeedCommentState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<FeedCommentEntity>? comments,
  }) {
    return FeedCommentState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      comments: comments ?? this.comments,
    );
  }
}

class FeedCommentViewmodel extends StateNotifier<FeedCommentState> {
  final TokenStorageService tokenStorageService = TokenStorageService();
  final FeedCommentRepository feedCommentRepository;
  FeedCommentViewmodel(this.feedCommentRepository) : super(FeedCommentState());

  Future<void> fetchFeedComments({required int feedId}) async {
    try {
      if (state.isLoading) return;
      final token = await tokenStorageService.getToken();
      if (token == null) {
        state = state.copyWith(errorMessage: "User not authenticated");
        return;
      }
      state = state.copyWith(isLoading: true, errorMessage: null);
      final feedCommentUrl = ApiEndpoints.feedComments(feedId);
      final comments = await feedCommentRepository.fetchFeedComments(
        url: feedCommentUrl,
        token: token,
      );

      state = state.copyWith(isLoading: false, comments: comments);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}

final feedCommentViewmodelProvider = StateNotifierProvider((ref) {
return FeedCommentViewmodel(
    FeedCommentRepository(NetworkService())
  );
});