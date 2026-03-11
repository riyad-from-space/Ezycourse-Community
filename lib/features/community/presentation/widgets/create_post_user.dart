import 'package:ezycourse_community/core/theme/app_colors.dart';
import 'package:ezycourse_community/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CreatePostUserInfo extends StatelessWidget {
  const CreatePostUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Container(
            width: 48,
            height: 48,
            color: AppColors.shimmerBase,
            child: Image.network(
              'https://letcheck.b-cdn.net/human_icon.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.person, color: AppColors.textGrey),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          'student tester',
          style: AppTextStyles.cardTitle.copyWith(fontSize: 18),
        ),
      ],
    );
  }
}
