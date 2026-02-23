import 'package:ezycourse_community/app/router/route_path.dart';
import 'package:ezycourse_community/features/auth/presentation/screens/login_screen.dart';
import 'package:ezycourse_community/features/community/presentation/screens/community_feed_screen.dart';
import 'package:ezycourse_community/features/community/presentation/screens/community_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static GoRouter? _router;

  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'rootNavigator');

  static void init({required bool isLoggedIn}) {
    _router = GoRouter(
      initialLocation:
          isLoggedIn ? RoutePath.community : RoutePath.signIn,
      navigatorKey: rootNavigatorKey,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          name: RoutePathName.splash,
          path: RoutePath.splash,
          builder: (final BuildContext context, final GoRouterState state) =>
              const SizedBox(),
        ),
        GoRoute(
          name: RoutePathName.signIn,
          path: RoutePath.signIn,
          builder: (final BuildContext context, final GoRouterState state) =>
              const LoginScreen(),
        ),
        GoRoute(
          name: RoutePathName.community,
          path: RoutePath.community,
          builder: (final BuildContext context, final GoRouterState state) =>
              const CommunityListScreen(),
        ),
        GoRoute(
          name: RoutePathName.feedScreen,
          path: RoutePath.feedScreen,
          builder: (final BuildContext context, final GoRouterState state) =>
              FeedScreen(
                  communityId:
                      state.pathParameters['communityId'] != null
                          ? int.parse(state.pathParameters['communityId']!)
                          : 0),
        ),
      ],
    );
  }

  static GoRouter get router {
    assert(_router != null, 'AppRouter.init() must be called before accessing AppRouter.router');
    return _router!;
  }
}
