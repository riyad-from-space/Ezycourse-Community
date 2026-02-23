import 'package:ezycourse_community/app/router/route_path.dart';
import 'package:ezycourse_community/features/community/domain/entities/community_list_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommunityListCard extends StatelessWidget {
  final List<CommunityListEntity> communities;
  const CommunityListCard({super.key, required this.communities});

  @override
  Widget build(BuildContext context) {
    if (communities.isEmpty) {
      return const Center(child: Text('No communities to display'));
    }
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: communities.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: .8,
      ),
      itemBuilder: (context, index) {
        final community = communities[index];
        return InkWell(
          onTap: () {
            context.pushNamed(
              RoutePathName.feedScreen,
              pathParameters: {'communityId': community.id.toString()},
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,

                  child: Image.network(
                    community.coverImage,
                    width: double.infinity,
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
                ),
                SizedBox(height: 4),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          community.title,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.people,
                              size: 14,
                              color: Colors.grey[600],
                            ),
                            SizedBox(width: 4),
                            Text(
                              '${community.totalMembers} members',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.book, size: 14, color: Colors.grey[600]),

                            SizedBox(width: 4),
                            Text(
                              '${community.totalFeeds}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
