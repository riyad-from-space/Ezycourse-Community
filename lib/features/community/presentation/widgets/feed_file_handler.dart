import 'dart:io';

import 'package:ezycourse_community/core/theme/app_colors.dart';
import 'package:ezycourse_community/features/community/domain/entities/feed_file_entity.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/feed_video_player.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/image_viewer.dart';
import 'package:flutter/material.dart';

Widget buildFeedImage(String fileLoc,
    {BoxFit fit = BoxFit.cover, double? width}) {
  final isNetwork = fileLoc.startsWith('http');

  if (isNetwork) {
    return Image.network(
      fileLoc,
      width: width,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          height: 300,
          color: AppColors.shimmerBase,
          child: Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
              strokeWidth: 2,
              color: AppColors.primary,
            ),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) => Container(
        height: 300,
        color: AppColors.shimmerBase,
        child: const Center(
            child: Icon(Icons.broken_image, color: AppColors.error)),
      ),
    );
  }

  // Local file path
  return Image.file(
    File(fileLoc),
    width: width,
    fit: fit,
    errorBuilder: (context, error, stackTrace) => Container(
      height: 300,
      color: AppColors.shimmerBase,
      child: const Center(
          child: Icon(Icons.broken_image, color: AppColors.error)),
    ),
  );
}

class FeedFileHandler extends StatelessWidget {
  final List<FeedFileEntity> files;
  const FeedFileHandler({super.key, required this.files});

  @override
  Widget build(BuildContext context) {
    final images = files.where((f) => f.fileType == 'image').toList();
    final videos = files.where((f) => f.fileType == 'video').toList();

    return Column(
      children: [
        // Videos
        if (videos.isNotEmpty) _buildVideoSection(videos),

        // Images
        if (images.isNotEmpty) ...[
          if (videos.isNotEmpty) const SizedBox(height: 8),
          _buildImageSection(context, images),
        ],
      ],
    );
  }

  Widget _buildVideoSection(List<FeedFileEntity> videos) {
    return Column(
      children: videos.map((video) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: FeedVideoPlayer(videoUrl: video.fileLoc),
        );
      }).toList(),
    );
  }

  Widget _buildImageSection(
      BuildContext context, List<FeedFileEntity> images) {
    // Single image takes full width
    if (images.length == 1) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: GestureDetector(
          onTap: () => _openImageViewer(context, images, 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: buildFeedImage(
              images[0].fileLoc,
              width: double.infinity,
            ),
          ),
        ),
      );
    }

    // Multiple images in grid
    final displayCount = images.length > 4 ? 4 : images.length;
    final remainingCount = images.length - 4;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: displayCount,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            childAspectRatio: 1,
            crossAxisSpacing: 4,
          ),
          itemBuilder: (context, index) {
            final isLastItem = index == 3 && remainingCount > 0;

            return GestureDetector(
              onTap: () => _openImageViewer(context, images, index),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  buildFeedImage(images[index].fileLoc),
                  if (isLastItem)
                    Container(
                      color: Colors.black.withValues(alpha: 0.6),
                      child: Center(
                        child: Text(
                          '+$remainingCount',
                          style: const TextStyle(
                            color: AppColors.textWhite,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _openImageViewer(
      BuildContext context, List<FeedFileEntity> images, int initialIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageViewerScreen(
          images: images,
          initialIndex: initialIndex,
        ),
      ),
    );
  }
}
