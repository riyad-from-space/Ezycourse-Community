import 'package:ezycourse_community/features/user_profile/domain/entities/user_profile_entity.dart';
import 'package:ezycourse_community/features/user_profile/domain/repositories/user_profile_repository.dart';

class UserProfileUsecase {
  final UserProfileRepository _userProfileRepository;
  UserProfileUsecase(this._userProfileRepository);

  Future<UserProfileEntity> call(final UserProfileUseCaseParam param) {
    return _userProfileRepository.getUserProfile(token: param.token);
  }
}

class UserProfileUseCaseParam {
  final String token;
  UserProfileUseCaseParam({required this.token});
}
