import 'package:ezycourse_community/app/router/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ezycourse_community/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/logout_dialog.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends ConsumerWidget {
  final int currentIndex;
  final ValueChanged<int> onIndexChanged;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _handleNavigation(index, context, ref),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Logout'),
      ],
    );
  }

  Future<void> _handleNavigation(
    int index,
    BuildContext context,
    WidgetRef ref,
  ) async {
    if (index == 0) {
      onIndexChanged(0);

      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) =>
          ShowLogoutDialog(onConfirm: () => Navigator.of(ctx).pop(true)),
    );

    if (confirmed == true) {
      try {
        await ref.read(authViewModelProvider.notifier).logout();

        context.pushReplacementNamed(RoutePathName.signIn);
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Logout failed: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }
}
