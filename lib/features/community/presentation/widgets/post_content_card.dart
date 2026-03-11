import 'package:ezycourse_community/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PostContentCard extends StatelessWidget {
  final TextEditingController textController;
  final bool isLoading;

  const PostContentCard({
    super.key,
    required this.textController,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: textController,
        enabled: !isLoading,
        maxLines: null,
        minLines: 6,
        style: const TextStyle(
          fontSize: 14,
          height: 1.5,
          color: AppColors.textDark,
        ),
        decoration: InputDecoration(
          hintText: "What's on your mind?",
          hintStyle: const TextStyle(
            fontSize: 14,
            color: AppColors.textGreyLight,
            fontWeight: FontWeight.w400,
          ),
          contentPadding: const EdgeInsets.all(16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
