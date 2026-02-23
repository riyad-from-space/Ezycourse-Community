import 'package:ezycourse_community/app/di/injection.dart';
import 'package:ezycourse_community/app/router/app_router.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Register all dependencies (NetworkService, Repositories, UseCases, etc.)
  await configureDependencies();

  // 2. Check token and init router
  final tokenStorageService = serviceLocator<TokenStorageService>();
  final hasToken = await tokenStorageService.hasToken();
  AppRouter.init(isLoggedIn: hasToken);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: AppRouter.router,
    );
  }
}
