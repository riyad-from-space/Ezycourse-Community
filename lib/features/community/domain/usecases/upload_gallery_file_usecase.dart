import 'package:ezycourse_community/features/community/domain/repositories/community_repository.dart';

class UploadGalleryFileUseCase {
  const UploadGalleryFileUseCase(this.repository);

  final CommunityRepository repository;

  Future<void> call(final UploadGalleryFileParams params) {
    return repository.uploadGalleryFile(
      token: params.token,
      filePath: params.filePath,
      fileType: params.fileType,
    );
  }
}

class UploadGalleryFileParams {
  UploadGalleryFileParams({
    required this.token,
    required this.filePath,
    required this.fileType,
  });

  final String token;
  final String filePath;
  final String fileType;
}
