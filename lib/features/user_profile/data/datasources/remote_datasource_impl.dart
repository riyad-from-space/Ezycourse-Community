import 'dart:convert';

import 'package:ezycourse_community/core/errors/app_exception.dart';
import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/features/user_profile/data/datasources/remote_datasource.dart';
import 'package:ezycourse_community/features/user_profile/data/models/user_profile_model.dart';

class UserProfileRemoteDatasourceImpl implements UserProfileRemoteDatasource {
  final NetworkService _networkService;

  UserProfileRemoteDatasourceImpl(this._networkService);

  @override
  Future<UserProfileModel> getUserProfile({
    required String token,
    required String url,
  }) async {
    final response = await _networkService.get(url: url, token: token);

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);

      return UserProfileModel.fromJson(body);
    } else {
      throw AppException("Failed to fetch Profile");
    }
  }
}
