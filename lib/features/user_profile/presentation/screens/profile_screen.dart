import 'package:ezycourse_community/app/router/route_path.dart';
import 'package:ezycourse_community/core/theme/app_colors.dart';
import 'package:ezycourse_community/core/theme/app_text_styles.dart';
import 'package:ezycourse_community/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/bottom_navbar.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/logout_dialog.dart';
import 'package:ezycourse_community/features/user_profile/presentation/viewmodel/user_profile_viewmodel.dart';
import 'package:ezycourse_community/features/user_profile/presentation/widgets/profile_header.dart';
import 'package:ezycourse_community/features/user_profile/presentation/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(userProfileViewModelProvider.notifier).fetchUserProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userProfileViewModelProvider);

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0.5,
        title: Text('Profile', style: AppTextStyles.screenTitle),
        centerTitle: false,
      ),
      body: state.isLoading
          ? const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            )
          : state.errorMessage != null && state.userProfile == null
              ? _buildErrorState(state.errorMessage!)
              : _buildContent(state),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }

  Widget _buildContent(UserProfileState state) {
    final profile = state.userProfile;
    if (profile == null) return const SizedBox.shrink();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        children: [
          ProfileHeader(profile: profile),
          const SizedBox(height: 24),
          Container(
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.cardBorder),
            ),
            child: Column(
              children: [
                ProfileMenuItem(
                  icon: Icons.person_outline_rounded,
                  label: profile.userType,
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      profile.userType,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Divider(height: 1, color: AppColors.cardBorder),
                ProfileMenuItem(
                  icon: Icons.logout_rounded,
                  label: 'Logout',
                  iconColor: AppColors.error,
                  labelColor: AppColors.error,
                  onTap: () => _handleLogout(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cloud_off_rounded,
              size: 48,
              color: AppColors.error.withValues(alpha: 0.7),
            ),
            const SizedBox(height: 16),
            Text(
              'Failed to load profile',
              style: AppTextStyles.screenTitle.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 6),
            Text(
              message,
              style: AppTextStyles.screenSubtitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () {
                ref
                    .read(userProfileViewModelProvider.notifier)
                    .fetchUserProfile();
              },
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.refresh_rounded, size: 20),
              label: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleLogout() async {
    final confirmed = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) =>
          ShowLogoutDialog(onConfirm: () => Navigator.of(ctx).pop(true)),
    );

    if (confirmed == true) {
      try {
        await ref.read(authViewModelProvider.notifier).logout();
        if (mounted) {
          context.pushReplacementNamed(RoutePathName.signIn);
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Logout failed: $e'),
              backgroundColor: AppColors.error,
            ),
          );
        }
      }
    }
  }
}
