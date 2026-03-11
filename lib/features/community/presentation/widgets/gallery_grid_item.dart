import 'package:ezycourse_community/core/theme/app_colors.dart';
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
            color: isSelected ? AppColors.primary : AppColors.cardBorder,
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
                      color: AppColors.textWhite70, size: 36),
                ),
              if (item.fileType != 'image')
                _buildTypeBadge(),
              if (isSelected) ...[
                Container(
                  color: AppColors.primary.withValues(alpha: 0.3),
                ),
                const Positioned(
                  top: 4,
                  right: 4,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: AppColors.primary,
                    child: Icon(Icons.check, color: AppColors.textWhite, size: 16),
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
              child: CircularProgressIndicator(
            strokeWidth: 2,
            color: AppColors.primary,
          ));
        },
        errorBuilder: (_, __, ___) => Container(
          color: AppColors.shimmerBase,
          child: const Icon(Icons.broken_image, color: AppColors.textGrey),
        ),
      );
    }

    return Container(
      color: AppColors.textDark,
      child: Center(
        child: Icon(
          item.fileType == 'audio' ? Icons.audiotrack : Icons.insert_drive_file,
          color: AppColors.textWhite,
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
          color: Colors.black.withValues(alpha: 0.54),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          item.fileType.toUpperCase(),
          style: const TextStyle(
            color: AppColors.textWhite,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
