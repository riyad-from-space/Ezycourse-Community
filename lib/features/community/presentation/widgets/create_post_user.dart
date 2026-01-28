import 'package:flutter/material.dart';

class CreatePostUserInfo extends StatelessWidget {
  const CreatePostUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipOval(
          child: Container(
            width: 48,
            height: 48,
            color: Colors.grey.shade200,
            child: Image.network(
              'https://letcheck.b-cdn.net/human_icon.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.person, color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'student tester',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}