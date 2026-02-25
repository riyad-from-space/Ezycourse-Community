import 'package:ezycourse_community/features/community/domain/entities/gallery_item_entity.dart';
import 'package:ezycourse_community/features/community/domain/repositories/community_repository.dart';

class GetGalleryItemsUseCase {
  const GetGalleryItemsUseCase(this.repository);

  final CommunityRepository repository;

  Future<List<GalleryItemEntity>> call(final GetGalleryItemsParams params) {
    return repository.getGalleryItems(
      token: params.token,
      fileType: params.fileType,
    );
  }
}

class GetGalleryItemsParams {
  GetGalleryItemsParams({
    required this.token,
    required this.fileType,
  });

  final String token;
  final String fileType;
}
