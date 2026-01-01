import 'package:ezycourse_community/features/community/domain/entities/community_list_entity.dart';
import 'package:flutter/material.dart';

class CommunityListCard extends StatelessWidget {
  final List<CommunityListEntity> communities;
  const CommunityListCard({super.key, required this.communities});

  @override
  Widget build(BuildContext context) {
        print('🟠 CommunityListCard build - ${communities.length} communities');
    
    if (communities.isEmpty) {
      print('⚠️ Communities list is empty!');
      return const Center(
        child: Text('No communities to display'),
      );
    }
    return GridView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: communities.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        print('🟠 Building card for: ${communities[index].title}');
        
        return Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1,color: Colors.grey),
            borderRadius: BorderRadius.circular(5)
          ),
          child: Column(children: [
            SizedBox(
              height: 40,
              child: Image.network(
                     communities[index].coverImage,
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
            )

          ],),

        );

      },
    );
  }
}
