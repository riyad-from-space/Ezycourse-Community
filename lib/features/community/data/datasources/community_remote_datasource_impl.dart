import 'dart:convert';

import 'package:ezycourse_community/core/errors/app_exception.dart';
import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/features/community/data/datasources/community_remote_datasource.dart';
import 'package:ezycourse_community/features/community/data/models/community_list_response_model.dart';

class CommunityRemoteDatasourceImpl implements CommunityRemoteDatasource {
  final NetworkService networkService;
  CommunityRemoteDatasourceImpl(this.networkService);

  @override
  Future<CommunityListResponseModel> getEnrolledCommunities({
    required final String token,
    required final String url,
  }) async {
    final response = await networkService.get(url: url, token: token);

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);
      return CommunityListResponseModel.fromJson(body);
    } else {
      throw AppException(
        'Failed to load communities',
        statusCode: response.statusCode,
      );
    }
  }
}
