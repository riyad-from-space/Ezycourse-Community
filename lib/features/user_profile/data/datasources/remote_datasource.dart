import 'package:ezycourse_community/features/user_profile/data/models/user_profile_model.dart';

abstract interface class UserProfileRemoteDatasource {
  Future<UserProfileModel> getUserProfile({
    required final String token,
    required final String url,
  });
}