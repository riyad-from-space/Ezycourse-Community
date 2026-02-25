import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';

import 'package:ezycourse_community/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ezycourse_community/features/auth/data/datasources/auth_remote_datasource_impl.dart';
import 'package:ezycourse_community/features/auth/data/repositories/auth_repository.dart';
import 'package:ezycourse_community/features/auth/domain/repositories/auth_repository.dart';


import 'package:ezycourse_community/features/auth/domain/usecases/login_usecase.dart';

import 'package:ezycourse_community/features/community/data/datasources/community_remote_datasource.dart';
import 'package:ezycourse_community/features/community/data/datasources/community_remote_datasource_impl.dart';

import 'package:ezycourse_community/features/community/data/repositories/community_repository_impl.dart';
import 'package:ezycourse_community/features/community/domain/repositories/community_repository.dart';

import 'package:ezycourse_community/features/community/domain/usecases/community_list_usecase.dart';
import 'package:ezycourse_community/features/community/domain/usecases/get_community_feeds_usecase.dart';
import 'package:ezycourse_community/features/community/domain/usecases/get_community_channels_usecase.dart';
import 'package:ezycourse_community/features/community/domain/usecases/create_post_usecase.dart';
import 'package:ezycourse_community/features/community/domain/usecases/create_feed_comment_usecase.dart';
import 'package:ezycourse_community/features/community/domain/usecases/create_post_react_usecase.dart';
import 'package:ezycourse_community/features/community/domain/usecases/get_feed_comments_usecase.dart';
import 'package:ezycourse_community/features/community/domain/usecases/get_gallery_items_usecase.dart';
import 'package:ezycourse_community/features/community/domain/usecases/upload_gallery_file_usecase.dart';

import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> configureDependencies() async {
  //core
  _registerCoreServices();

  //auth
  _registerAuthFeature();

  //community
  _registerCommunityFeature();

  await serviceLocator.allReady();
}

// core
void _registerCoreServices() {
  serviceLocator.registerLazySingleton<NetworkService>(() => NetworkService());
  serviceLocator.registerLazySingleton<TokenStorageService>(
    () => TokenStorageService(),
  );
}

//auth
void _registerAuthFeature() {
  //datasource
  serviceLocator.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(serviceLocator<NetworkService>()),
  );

  //repository
  serviceLocator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(serviceLocator<AuthRemoteDatasource>()),
  );

  //usecase
  serviceLocator.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(serviceLocator<AuthRepository>()),
  );
}

//Community
void _registerCommunityFeature() {
  //datasource
  serviceLocator.registerLazySingleton<CommunityRemoteDatasource>(
    () => CommunityRemoteDatasourceImpl(serviceLocator<NetworkService>()),
  );

  //repository
  serviceLocator.registerLazySingleton<CommunityRepository>(
    () => CommunityRepositoryImpl(serviceLocator<CommunityRemoteDatasource>()),
  );

  //usecase
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

  serviceLocator.registerLazySingleton<GetGalleryItemsUseCase>(
    () => GetGalleryItemsUseCase(serviceLocator<CommunityRepository>()),
  );

  serviceLocator.registerLazySingleton<UploadGalleryFileUseCase>(
    () => UploadGalleryFileUseCase(serviceLocator<CommunityRepository>()),
  );
}
