import 'package:ezycourse_community/features/user_profile/domain/entities/user_profile_entity.dart';

abstract interface class UserProfileRepository {
  Future<UserProfileEntity> getUserProfile({
    required final String token,
  });
}

