import 'package:flutter/material.dart';

enum MediaSourceOption { camera, gallery, library }

Future<MediaSourceOption?> showMediaSourceBottomSheet({
  required BuildContext context,
  required bool isVideo,
}) {
  return showModalBottomSheet<MediaSourceOption>(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isVideo ? 'Pick Video' : 'Pick Image',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _SourceOption(
                    icon: Icons.camera_alt,
                    label: 'Camera',
                    color: Colors.blue,
                    onTap: () =>
                        Navigator.pop(context, MediaSourceOption.camera),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _SourceOption(
                    icon: Icons.photo_library,
                    label: 'Gallery',
                    color: Colors.purple,
                    onTap: () =>
                        Navigator.pop(context, MediaSourceOption.gallery),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _SourceOption(
                    icon: Icons.cloud_outlined,
                    label: 'Library',
                    color: Colors.teal,
                    onTap: () =>
                        Navigator.pop(context, MediaSourceOption.library),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

class _SourceOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _SourceOption({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
