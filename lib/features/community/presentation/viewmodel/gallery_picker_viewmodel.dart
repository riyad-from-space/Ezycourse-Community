import 'package:ezycourse_community/app/di/injection.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';
import 'package:ezycourse_community/features/community/domain/entities/gallery_item_entity.dart';
import 'package:ezycourse_community/features/community/domain/usecases/get_gallery_items_usecase.dart';
import 'package:ezycourse_community/features/community/domain/usecases/upload_gallery_file_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GalleryPickerState {
  final bool isLoading;
  final bool isUploading;
  final String? errorMessage;
  final List<GalleryItemEntity> items;
  final String fileType;
  final Set<int> selectedItemIds;

  const GalleryPickerState({
    this.isLoading = false,
    this.isUploading = false,
    this.errorMessage,
    this.items = const [],
    required this.fileType,
    this.selectedItemIds = const {},
  });

  GalleryPickerState copyWith({
    bool? isLoading,
    bool? isUploading,
    String? errorMessage,
    List<GalleryItemEntity>? items,
    Set<int>? selectedItemIds,
    bool clearError = false,
  }) {
    return GalleryPickerState(
      isLoading: isLoading ?? this.isLoading,
      isUploading: isUploading ?? this.isUploading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      items: items ?? this.items,
      fileType: fileType,
      selectedItemIds: selectedItemIds ?? this.selectedItemIds,
    );
  }
}

class GalleryPickerViewModel extends StateNotifier<GalleryPickerState> {
  final GetGalleryItemsUseCase _getItemsUseCase;
  final UploadGalleryFileUseCase _uploadUseCase;
  final TokenStorageService _tokenStorageService;
  int _fetchId = 0;

  GalleryPickerViewModel(
    this._getItemsUseCase,
    this._uploadUseCase,
    this._tokenStorageService, {
    required String fileType,
  }) : super(GalleryPickerState(fileType: fileType));

  Future<void> fetchGalleryItems() async {
    final currentFetchId = ++_fetchId;
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final token = await _tokenStorageService.getToken();
      if (token == null || token.isEmpty) {
        throw Exception('No authentication token found');
      }

      final items = await _getItemsUseCase.call(
        GetGalleryItemsParams(
          token: token,
          fileType: state.fileType,
        ),
      );

      if (currentFetchId != _fetchId) return;
      state = state.copyWith(isLoading: false, items: items);
    } catch (e) {
      if (currentFetchId != _fetchId) return;
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> uploadFile(String filePath) async {
    state = state.copyWith(isUploading: true, clearError: true);

    try {
      final token = await _tokenStorageService.getToken();
      if (token == null || token.isEmpty) {
        throw Exception('No authentication token found');
      }

      await _uploadUseCase.call(
        UploadGalleryFileParams(
          token: token,
          filePath: filePath,
          fileType: state.fileType,
        ),
      );

      state = state.copyWith(isUploading: false);
      // Refresh gallery after successful upload
      fetchGalleryItems();
    } catch (e) {
      state = state.copyWith(isUploading: false, errorMessage: e.toString());
    }
  }

  void toggleItemSelection(int itemId) {
    final selected = Set<int>.from(state.selectedItemIds);
    if (selected.contains(itemId)) {
      selected.remove(itemId);
    } else {
      selected.add(itemId);
    }
    state = state.copyWith(selectedItemIds: selected);
  }

  List<GalleryItemEntity> getSelectedItems() {
    return state.items
        .where((item) => state.selectedItemIds.contains(item.id))
        .toList();
  }
}

final galleryPickerViewModelProvider = StateNotifierProvider.autoDispose
    .family<GalleryPickerViewModel, GalleryPickerState, String>(
  (ref, fileType) {
    return GalleryPickerViewModel(
      serviceLocator<GetGalleryItemsUseCase>(),
      serviceLocator<UploadGalleryFileUseCase>(),
      serviceLocator<TokenStorageService>(),
      fileType: fileType,
    );
  },
);
