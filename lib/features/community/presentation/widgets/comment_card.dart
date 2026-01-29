import 'package:ezycourse_community/features/community/domain/entities/feed_comment_entity.dart';
import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {
  final List<FeedCommentEntity> comments;
  const CommentCard({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: comments.length,
      itemBuilder: (context, index) {
        final comment = comments[index];
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 0.2)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey,
          backgroundImage: comment.user.profilePic.isNotEmpty
              ? NetworkImage(comment.user.profilePic)
              : null,
        ),
              const SizedBox(width: 12),
           
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            
                    Text(
                      comment.user.fullName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Comment text
                    Text(
                      comment.commentText,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
