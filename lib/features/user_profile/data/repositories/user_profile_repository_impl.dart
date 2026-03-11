import 'package:ezycourse_community/core/constants/api.dart';
import 'package:ezycourse_community/features/user_profile/data/datasources/remote_datasource.dart';
import 'package:ezycourse_community/features/user_profile/domain/entities/user_profile_entity.dart';
import 'package:ezycourse_community/features/user_profile/domain/repositories/user_profile_repository.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final UserProfileRemoteDatasource _userProfileRemoteDatasource;

  UserProfileRepositoryImpl(this._userProfileRemoteDatasource);
  @override
  Future<UserProfileEntity> getUserProfile({required String token}) async {
    final userProfileUrl = ApiEndpoints.userProfile;
    final response = await _userProfileRemoteDatasource.getUserProfile(
      token: token,
      url: userProfileUrl,
    );

    return response.toEntity();
  }
}
