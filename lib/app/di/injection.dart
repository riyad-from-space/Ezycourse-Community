import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';
import 'package:ezycourse_community/features/auth/data/repositories/auth_repository.dart';
import 'package:ezycourse_community/features/community/data/datasources/community_remote_datasource.dart';
import 'package:ezycourse_community/features/community/data/datasources/community_remote_datasource_impl.dart';
import 'package:ezycourse_community/features/community/data/repositories/community_channel_repository.dart';
import 'package:ezycourse_community/features/community/data/repositories/community_feed_repository.dart';
import 'package:ezycourse_community/features/community/data/repositories/community_list_repository_impl.dart';
import 'package:ezycourse_community/features/community/data/repositories/create_feed_comment_repository.dart';
import 'package:ezycourse_community/features/community/data/repositories/create_post_react_repository.dart';
import 'package:ezycourse_community/features/community/data/repositories/create_post_repository.dart';
import 'package:ezycourse_community/features/community/data/repositories/feed_comment_repositoty.dart';
import 'package:ezycourse_community/features/community/domain/repositories/community_list_repository.dart';
import 'package:ezycourse_community/features/community/domain/usecases/community_list_usecase.dart';
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
  // Single NetworkService instance shared by all repositories
  serviceLocator.registerLazySingleton<NetworkService>(() => NetworkService());

  // Single TokenStorageService shared by all viewmodels
  serviceLocator.registerLazySingleton<TokenStorageService>(
    () => TokenStorageService(),
  );
}

// ─── Auth Feature ──────────────────────────────────────
void _registerAuthFeature() {
  serviceLocator.registerLazySingleton<AuthRepository>(
    () => AuthRepository(serviceLocator<NetworkService>()),
  );
}

// ─── Community Feature ─────────────────────────────────
void _registerCommunityFeature() {
  // 1. DataSource — talks to the API
  serviceLocator.registerLazySingleton<CommunityRemoteDatasource>(
    () => CommunityRemoteDatasourceImpl(serviceLocator<NetworkService>()),
  );

  // 2. Repositories — each depends on NetworkService or DataSource
  serviceLocator.registerLazySingleton<CommunityListRepository>(
    () => CommunityListRepositoryImpl(serviceLocator<CommunityRemoteDatasource>()),
  );

  serviceLocator.registerLazySingleton<CommunityRepository>(
    () => CommunityRepository(serviceLocator<NetworkService>()),
  );

  serviceLocator.registerLazySingleton<CommunityChannelRepository>(
    () => CommunityChannelRepository(serviceLocator<NetworkService>()),
  );

  serviceLocator.registerLazySingleton<CreatePostRepository>(
    () => CreatePostRepository(serviceLocator<NetworkService>()),
  );

  serviceLocator.registerLazySingleton<CreateFeedCommentRepository>(
    () => CreateFeedCommentRepository(serviceLocator<NetworkService>()),
  );

  serviceLocator.registerLazySingleton<CreatePostReactRepository>(
    () => CreatePostReactRepository(serviceLocator<NetworkService>()),
  );

  serviceLocator.registerLazySingleton<FeedCommentRepository>(
    () => FeedCommentRepository(serviceLocator<NetworkService>()),
  );

  // 3. UseCases — depend on repositories
  serviceLocator.registerLazySingleton<GetEnrolledCommunityUseCase>(
    () => GetEnrolledCommunityUseCase(serviceLocator<CommunityListRepository>()),
  );
}
