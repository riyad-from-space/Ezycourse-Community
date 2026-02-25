import 'package:flutter/material.dart';

/// Row of action buttons (Photo, Video, Feeling) for create post.
class PostActionButtons extends StatelessWidget {
  final VoidCallback? onPhoto;
  final VoidCallback? onVideo;
  final VoidCallback? onFeeling;

  const PostActionButtons({
    super.key,
    required this.onPhoto,
    required this.onVideo,
    required this.onFeeling,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ActionButton(
            icon: Icons.image,
            label: 'Photo',
            onTap: onPhoto,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _ActionButton(
            icon: Icons.videocam,
            label: 'Video',
            onTap: onVideo,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _ActionButton(
            icon: Icons.emoji_emotions,
            label: 'Feeling',
            onTap: onFeeling,
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = onTap == null;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isDisabled ? Colors.grey[200] : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20, color: isDisabled ? Colors.grey : Colors.blue),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isDisabled ? Colors.grey : Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
