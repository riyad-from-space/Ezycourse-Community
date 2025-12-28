import 'package:flutter/material.dart';

import 'package:ezycourse_community/features/community/domain/entities/feed_entity.dart';

class EngagementBar extends StatelessWidget {
  final FeedEntity feed;
  final VoidCallback? onLike;
  final VoidCallback? onComment;
  final VoidCallback? onShare;
  const EngagementBar({
    super.key, 
    required this.feed,
    this.onLike,
    this.onComment,
    this.onShare,
  });
  
  @override
  Widget build(BuildContext context) {
   return Container(
    padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
    decoration: BoxDecoration(
      border: Border(
          top: BorderSide(color: Colors.grey[200]!),
          bottom: BorderSide(color: Colors.grey[200]!),
        ),
        
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onLike,
          child: Row(
            children: [
              Icon(Icons.thumb_up_alt, size: 20, color: Colors.blue) ,
             
              const SizedBox(width: 6),
              Text('${feed.likeCount}', style: TextStyle(color: Colors.grey[600])),
            ],
          ),
        ),
        InkWell(
          onTap: onComment,
          child: Row(
            children: [
              Icon(Icons.comment_outlined, size: 20, color: Colors.grey[600]),
              const SizedBox(width: 6),
              Text('${feed.commentCount}', style: TextStyle(color: Colors.grey[600])),
            ],
          ),
        ),
        InkWell(
          onTap: onShare,
          child: Row(
            children: [
              Icon(Icons.share_outlined, size: 20, color: Colors.grey[600]),
              const SizedBox(width: 6),
              Text('${feed.shareCount}', style: TextStyle(color: Colors.grey[600])),
            ],
          ),
        ),
      ],
    ),

   );
  }
}
