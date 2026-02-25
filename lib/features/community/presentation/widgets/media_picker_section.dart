import 'package:ezycourse_community/features/community/presentation/screens/gallery_picker_screen.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/media_picker_widget.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/post_action_buttons.dart';
import 'package:flutter/material.dart';

class MediaPickerSection extends StatefulWidget {
  final bool isLoading;
  final ValueChanged<List<PickedMedia>> onMediaChanged;

  const MediaPickerSection({
    super.key,
    required this.isLoading,
    required this.onMediaChanged,
  });

  @override
  State<MediaPickerSection> createState() => _MediaPickerSectionState();
}

class _MediaPickerSectionState extends State<MediaPickerSection> {
  final List<PickedMedia> _mediaList = [];

  Future<void> _openGallery({required String fileType}) async {
    final result = await Navigator.push<List<PickedMedia>>(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryPickerScreen(fileType: fileType),
      ),
    );
    if (result != null && result.isNotEmpty) {
      setState(() {
        _mediaList.addAll(result);
      });
      widget.onMediaChanged(_mediaList);
    }
  }

  void _removeMedia(int index) {
    setState(() {
      _mediaList.removeAt(index);
    });
    widget.onMediaChanged(_mediaList);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_mediaList.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: MediaPickerWidget(
              mediaList: _mediaList,
              onRemove: _removeMedia,
            ),
          ),
        PostActionButtons(
          onPhoto: widget.isLoading
              ? null
              : () => _openGallery(fileType: 'image'),
          onVideo: widget.isLoading
              ? null
              : () => _openGallery(fileType: 'video'),
          onFeeling: widget.isLoading ? null : () {},
        ),
      ],
    );
  }
}
