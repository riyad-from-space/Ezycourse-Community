import 'package:ezycourse_community/features/community/domain/entities/feed_file_entity.dart';
import 'package:flutter/material.dart';

class FeedFileHandler extends StatelessWidget {
  final List<FeedFileEntity> files;
  const FeedFileHandler({super.key, required this.files});
  @override
  Widget build(BuildContext context) {
    final images = files.where((file) => file.fileType == 'image').toList();

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: images.isNotEmpty
          ? ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,

                itemCount: images.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  childAspectRatio: 1,
                  crossAxisSpacing: 4,
                ),
                itemBuilder: (context, index) {
                  return Image.network(
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
                  );
                },
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
