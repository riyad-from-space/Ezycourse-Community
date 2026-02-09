import 'package:ezycourse_community/features/community/domain/entities/feed_file_entity.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/image_viewer.dart';
import 'package:flutter/material.dart';

class FeedFileHandler extends StatelessWidget {
  final List<FeedFileEntity> files;
  const FeedFileHandler({super.key, required this.files});

  @override
  Widget build(BuildContext context) {
    final images = files.where((file) => file.fileType == 'image').toList();

    if (images.isEmpty) return const SizedBox.shrink();

    // Single image takes full width
    if (images.length == 1) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: GestureDetector(
          onTap: () => _openImageViewer(context, images, 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              images[0].fileLoc,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  height: 300,
                  color: Colors.grey[300],
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                      strokeWidth: 2,
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) => Container(
                height: 300,
                color: Colors.grey[300],
                child: const Center(
                  child: Icon(Icons.broken_image, color: Colors.red),
                ),
              ),
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
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                  Image.network(
                    images[index].fileLoc,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        color: Colors.grey[300],
                        child: Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                            strokeWidth: 2,
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.broken_image, color: Colors.red),
                      ),
                    ),
                  ),
                  if (isLastItem)
                    Container(
                      color: Colors.black.withOpacity(0.6),
                      child: Center(
                        child: Text(
                          '+$remainingCount',
                          style: const TextStyle(
                            color: Colors.white,
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

  void _openImageViewer(BuildContext context, List<FeedFileEntity> images, int initialIndex) {
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

