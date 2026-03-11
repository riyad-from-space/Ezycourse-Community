import 'package:ezycourse_community/core/theme/app_colors.dart';
import 'package:ezycourse_community/core/theme/app_text_styles.dart';
import 'package:ezycourse_community/features/community/presentation/viewmodel/gallery_picker_viewmodel.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/gallery_grid_item.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/media_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class GalleryPickerScreen extends ConsumerStatefulWidget {
  final String fileType;

  const GalleryPickerScreen({super.key, required this.fileType});

  @override
  ConsumerState<GalleryPickerScreen> createState() =>
      _GalleryPickerScreenState();
}

class _GalleryPickerScreenState extends ConsumerState<GalleryPickerScreen> {
  late final _provider = galleryPickerViewModelProvider(widget.fileType);
  final _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(_provider.notifier).fetchGalleryItems();
    });
  }

  void _onDone() {
    final selectedItems = ref.read(_provider.notifier).getSelectedItems();

    final pickedMediaList = selectedItems.map((item) {
      final type = switch (item.fileType) {
        'video' => MediaType.video,
        'audio' => MediaType.audio,
        _ => MediaType.image,
      };
      return PickedMedia(
        remoteUrl: item.fileLink,
        type: type,
        originalName: item.originalName,
        fileExtension:
            item.fileName.contains('.') ? item.fileName.split('.').last : null,
      );
    }).toList();

    Navigator.pop(context, pickedMediaList);
  }

  Future<void> _uploadFromPhone() async {
    try {
      final XFile? picked;
      if (widget.fileType == 'video') {
        picked = await _imagePicker.pickVideo(source: ImageSource.gallery);
      } else {
        picked = await _imagePicker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 85,
        );
      }

      if (picked != null) {
        ref.read(_provider.notifier).uploadFile(picked.path);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to pick file: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(_provider);
    final isImage = widget.fileType == 'image';

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.cardBackground,
        centerTitle: true,
        title: Text(
          isImage ? 'Photo Gallery' : 'Video Gallery',
          style: AppTextStyles.cardTitle.copyWith(fontSize: 18),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Center(
              child: ElevatedButton(
                onPressed: state.selectedItemIds.isEmpty ? null : _onDone,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.textWhite,
                  disabledBackgroundColor: AppColors.shimmerBase,
                  disabledForegroundColor: AppColors.textGrey,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  state.selectedItemIds.isEmpty
                      ? 'Done'
                      : 'Done (${state.selectedItemIds.length})',
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          _buildBody(state),
          if (state.isUploading)
            Container(
              color: Colors.black.withValues(alpha: 0.26),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator(
                      color: AppColors.textWhite,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Uploading...',
                      style: AppTextStyles.subheading.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: state.isUploading ? null : _uploadFromPhone,
        backgroundColor:
            state.isUploading ? AppColors.textGrey : AppColors.primary,
        child: Icon(
          isImage ? Icons.add_photo_alternate : Icons.video_call,
          color: AppColors.textWhite,
        ),
      ),
    );
  }

  Widget _buildBody(GalleryPickerState state) {
    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      );
    }

    if (state.errorMessage != null && state.items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 60,
              color: AppColors.error.withValues(alpha: 0.6),
            ),
            const SizedBox(height: 16),
            Text(
              state.errorMessage!,
              textAlign: TextAlign.center,
              style: AppTextStyles.screenSubtitle,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () =>
                  ref.read(_provider.notifier).fetchGalleryItems(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.textWhite,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (state.items.isEmpty) {
      return Center(
        child: Text('No items found', style: AppTextStyles.screenSubtitle),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: state.items.length,
      itemBuilder: (context, index) {
        final item = state.items[index];
        return GalleryGridItem(
          item: item,
          isSelected: state.selectedItemIds.contains(item.id),
          onTap: () =>
              ref.read(_provider.notifier).toggleItemSelection(item.id),
        );
      },
    );
  }
}
