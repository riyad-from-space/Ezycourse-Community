import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';

// Auth Feature
import 'package:ezycourse_community/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ezycourse_community/features/auth/data/datasources/auth_remote_datasource_impl.dart';
import 'package:ezycourse_community/features/auth/data/repositories/auth_repository.dart';
import 'package:ezycourse_community/features/auth/domain/repositories/auth_repository.dart'
    as auth_domain;
import 'package:ezycourse_community/features/auth/domain/usecases/login_usecase.dart';

// Community Feature - DataSource
import 'package:ezycourse_community/features/community/data/datasources/community_remote_datasource.dart';
import 'package:ezycourse_community/features/community/data/datasources/community_remote_datasource_impl.dart';

// Community Feature - Repository
import 'package:ezycourse_community/features/community/data/repositories/community_repository_impl.dart';
import 'package:ezycourse_community/features/community/domain/repositories/community_repository.dart';

// Community Feature - UseCases
import 'package:ezycourse_community/features/community/domain/usecases/community_list_usecase.dart';
import 'package:ezycourse_community/features/community/domain/usecases/get_community_feeds_usecase.dart';
import 'package:ezycourse_community/features/community/domain/usecases/get_community_channels_usecase.dart';
import 'package:ezycourse_community/features/community/domain/usecases/create_post_usecase.dart';
import 'package:ezycourse_community/features/community/domain/usecases/create_feed_comment_usecase.dart';
import 'package:ezycourse_community/features/community/domain/usecases/create_post_react_usecase.dart';
import 'package:ezycourse_community/features/community/domain/usecases/get_feed_comments_usecase.dart';

import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> configureDependencies() async {
  // ===== CORE SERVICES =====
  _registerCoreServices();

  // ===== AUTH FEATURE =====
  _registerAuthFeature();

  // ===== COMMUNITY FEATURE =====
  _registerCommunityFeature();

  await serviceLocator.allReady();
}

// ─── Core ──────────────────────────────────────────────
void _registerCoreServices() {
  serviceLocator.registerLazySingleton<NetworkService>(() => NetworkService());
  serviceLocator.registerLazySingleton<TokenStorageService>(
    () => TokenStorageService(),
  );
}

// ─── Auth Feature ──────────────────────────────────────
void _registerAuthFeature() {
  // 1. DataSource
  serviceLocator.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(serviceLocator<NetworkService>()),
  );

  // 2. Repository
  serviceLocator.registerLazySingleton<auth_domain.AuthRepository>(
    () => AuthRepositoryImpl(serviceLocator<AuthRemoteDatasource>()),
  );

  // 3. UseCase
  serviceLocator.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(serviceLocator<auth_domain.AuthRepository>()),
  );
}

// ─── Community Feature ─────────────────────────────────
void _registerCommunityFeature() {
  // 1. DataSource — single shared datasource for all community APIs
  serviceLocator.registerLazySingleton<CommunityRemoteDatasource>(
    () => CommunityRemoteDatasourceImpl(serviceLocator<NetworkService>()),
  );

  // 2. Repository — single repository covering all community operations
  serviceLocator.registerLazySingleton<CommunityRepository>(
    () => CommunityRepositoryImpl(serviceLocator<CommunityRemoteDatasource>()),
  );

  // 3. UseCases — all depend on the single CommunityRepository
  serviceLocator.registerLazySingleton<GetEnrolledCommunityUseCase>(
    () => GetEnrolledCommunityUseCase(serviceLocator<CommunityRepository>()),
  );

  serviceLocator.registerLazySingleton<GetCommunityFeedsUseCase>(
    () => GetCommunityFeedsUseCase(serviceLocator<CommunityRepository>()),
  );

  serviceLocator.registerLazySingleton<GetCommunityChannelsUseCase>(
    () => GetCommunityChannelsUseCase(serviceLocator<CommunityRepository>()),
  );

  serviceLocator.registerLazySingleton<CreatePostUseCase>(
    () => CreatePostUseCase(serviceLocator<CommunityRepository>()),
  );

  serviceLocator.registerLazySingleton<CreateFeedCommentUseCase>(
    () => CreateFeedCommentUseCase(serviceLocator<CommunityRepository>()),
  );

  serviceLocator.registerLazySingleton<CreatePostReactUseCase>(
    () => CreatePostReactUseCase(serviceLocator<CommunityRepository>()),
  );

  serviceLocator.registerLazySingleton<GetFeedCommentsUseCase>(
    () => GetFeedCommentsUseCase(serviceLocator<CommunityRepository>()),
  );
}
