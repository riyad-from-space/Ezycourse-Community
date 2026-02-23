import 'dart:convert';

import 'package:ezycourse_community/core/errors/app_exception.dart';
import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/features/community/data/models/community_channel_model.dart';
import 'package:ezycourse_community/features/community/domain/entities/community_channel_entity.dart';

class CommunityChannelRepository {
  final NetworkService networkService;
  CommunityChannelRepository(this.networkService);

  Future<List<CommunityChannelEntity>> fetchCommunityChannels({
    required String url,
    required String token,
  }) async {
    final response = await networkService.get(url: url, token: token);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as List;
      return jsonData
          .map((x) => CommunityChannelModel.fromJson(x).toEntity())
          .toList();
    } else {
      throw AppException(
        'Failed to load channels',
        statusCode: response.statusCode,
      );
    }
  }
}
