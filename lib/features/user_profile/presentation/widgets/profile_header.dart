import 'package:ezycourse_community/core/theme/app_colors.dart';
import 'package:ezycourse_community/features/community/presentation/utils/time_formatter.dart';
import 'package:ezycourse_community/features/user_profile/domain/entities/user_profile_entity.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final UserProfileEntity profile;

  const ProfileHeader({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 48,
          backgroundColor: AppColors.primary.withValues(alpha: 0.1),
          backgroundImage: profile.profilePic.isNotEmpty
              ? NetworkImage(profile.profilePic)
              : null,
          child: profile.profilePic.isEmpty
              ? Text(
                  TimeFormatter.getInitials(profile.fullName),
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                  ),
                )
              : null,
        ),
        const SizedBox(height: 16),
        Text(
          profile.fullName,
          style: const TextStyle(
            color: AppColors.textDark,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          profile.userType,
          style: const TextStyle(
            color: AppColors.textGrey,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
