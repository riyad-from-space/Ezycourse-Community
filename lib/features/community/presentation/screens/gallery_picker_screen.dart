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
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          isImage ? 'Photo Gallery' : 'Video Gallery',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Center(
              child: ElevatedButton(
                onPressed: state.selectedItemIds.isEmpty ? null : _onDone,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  disabledBackgroundColor: Colors.grey[300],
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
                  style: TextStyle(
                    color: state.selectedItemIds.isEmpty
                        ? Colors.grey
                        : Colors.white,
                  ),
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
              color: Colors.black26,
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(color: Colors.white),
                    SizedBox(height: 16),
                    Text(
                      'Uploading...',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: state.isUploading ? null : _uploadFromPhone,
        backgroundColor: state.isUploading ? Colors.grey : Colors.blue,
        child: Icon(
          isImage ? Icons.add_photo_alternate : Icons.video_call,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildBody(GalleryPickerState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.errorMessage != null && state.items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 60, color: Colors.red[300]),
            const SizedBox(height: 16),
            Text(state.errorMessage!, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () =>
                  ref.read(_provider.notifier).fetchGalleryItems(),
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (state.items.isEmpty) {
      return const Center(child: Text('No items found'));
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
