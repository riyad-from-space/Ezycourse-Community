import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';
import 'package:ezycourse_community/features/community/data/repositories/create_feed_comment_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateFeedCommentState {
  final bool isLoading;
  final String? errorMessage;

  const CreateFeedCommentState({this.isLoading = false, this.errorMessage});

  CreateFeedCommentState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool clearError = false,
  }) {
    return CreateFeedCommentState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}

class CreateFeedCommentViewmodel extends StateNotifier<CreateFeedCommentState> {
  final CreateFeedCommentRepository createFeedCommentRepository;
  final TokenStorageService tokenStorageService = TokenStorageService();
  CreateFeedCommentViewmodel(this.createFeedCommentRepository) : super(CreateFeedCommentState());

  Future<void> createFeedComment({
    required String commentText,
    required int feedId,
  }) async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final token = await tokenStorageService.getToken();
      await createFeedCommentRepository.createFeedComment(
        commentText: commentText,
        token: token,
        feedId: feedId,
      );
      print('Comment created for feed ID: $feedId');
      state = state.copyWith(isLoading: false);
    } catch (e) {
      print('Error creating comment: $e');
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}

final createFeedCommentViewmodelProvider =
    StateNotifierProvider<CreateFeedCommentViewmodel, CreateFeedCommentState>((ref) {
      return CreateFeedCommentViewmodel(CreateFeedCommentRepository(NetworkService()));
    });