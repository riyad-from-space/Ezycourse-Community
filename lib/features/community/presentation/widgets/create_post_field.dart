import 'package:ezycourse_community/core/theme/app_colors.dart';
import 'package:ezycourse_community/features/community/presentation/utils/time_formatter.dart';
import 'package:ezycourse_community/features/user_profile/presentation/viewmodel/user_profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePostField extends ConsumerWidget {
  const CreatePostField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(userProfileViewModelProvider);
    final profile = profileState.userProfile;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.primary.withValues(alpha: 0.1),
            backgroundImage: profile != null && profile.profilePic.isNotEmpty
                ? NetworkImage(profile.profilePic)
                : null,
            child: profile == null || profile.profilePic.isEmpty
                ? profile != null
                    ? Text(
                        TimeFormatter.getInitials(profile.fullName),
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                      )
                    : const Icon(
                        Icons.person_rounded,
                        color: AppColors.primary,
                        size: 20,
                      )
                : null,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.cardBorder),
              ),
              child: Text(
                "What's on your mind?",
                style: TextStyle(
                  color: AppColors.textGreyLight,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
