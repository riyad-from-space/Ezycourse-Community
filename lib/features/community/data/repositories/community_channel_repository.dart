import 'dart:convert';

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
    try {
      final response = await networkService.get(url: url, token: token);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as List;

        List<CommunityChannelEntity> tempList = [];
        for (var x in jsonData) {
          final CommunityChannelModel model = CommunityChannelModel.fromJson(x);
          tempList.add(model.toEntity());
        }
        return tempList;
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }
}
