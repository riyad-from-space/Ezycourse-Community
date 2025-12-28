import 'package:ezycourse_community/features/community/domain/entities/feed_entity.dart';
import 'package:ezycourse_community/features/community/presentation/utils/time_formatter.dart';
import 'package:flutter/material.dart';

class AuthorHeader extends StatelessWidget {
  final FeedEntity feed;
  final VoidCallback? onMenuTap;

  const AuthorHeader({super.key, required this.feed, this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey,
          backgroundImage: feed.userPic.isNotEmpty
              ? NetworkImage(feed.userPic)
              : null,
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                feed.userName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(width: 8),
              Text(
                TimeFormatter.formatRelativeTime(feed.createdAt),
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: onMenuTap,
          icon: Icon(Icons.more_horiz),
          constraints: BoxConstraints(),
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
