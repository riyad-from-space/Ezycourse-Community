import 'package:ezycourse_community/features/community/domain/entities/gallery_item_entity.dart';
import 'package:flutter/material.dart';

class GalleryGridItem extends StatelessWidget {
  final GalleryItemEntity item;
  final bool isSelected;
  final VoidCallback onTap;

  const GalleryGridItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey[300]!,
            width: isSelected ? 3 : 1,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: Stack(
            fit: StackFit.expand,
            children: [
              _buildThumbnail(),
              if (item.fileType == 'video')
                const Center(
                  child: Icon(Icons.play_circle_fill,
                      color: Colors.white70, size: 36),
                ),
              if (item.fileType != 'image')
                _buildTypeBadge(),
              if (isSelected) ...[
                Container(color: Colors.blue.withValues(alpha: 0.3)),
                const Positioned(
                  top: 4,
                  right: 4,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.check, color: Colors.white, size: 16),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThumbnail() {
    final imageUrl =
        item.fileType == 'video' ? item.thumbnailUrl : item.fileLink;

    if (imageUrl != null && imageUrl.isNotEmpty) {
      return Image.network(
        imageUrl,
        fit: BoxFit.cover,
        loadingBuilder: (_, child, progress) {
          if (progress == null) return child;
          return const Center(
              child: CircularProgressIndicator(strokeWidth: 2));
        },
        errorBuilder: (_, __, ___) => Container(
          color: Colors.grey[200],
          child: const Icon(Icons.broken_image, color: Colors.grey),
        ),
      );
    }

    return Container(
      color: Colors.grey[900],
      child: Center(
        child: Icon(
          item.fileType == 'audio' ? Icons.audiotrack : Icons.insert_drive_file,
          color: Colors.white,
          size: 36,
        ),
      ),
    );
  }

  Widget _buildTypeBadge() {
    return Positioned(
      bottom: 4,
      left: 4,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          item.fileType.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
