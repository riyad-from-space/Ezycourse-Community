import 'dart:convert';

import 'package:ezycourse_community/core/errors/app_exception.dart';
import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:http/http.dart' as http;
import 'package:ezycourse_community/features/community/data/datasources/community_remote_datasource.dart';
import 'package:ezycourse_community/features/community/data/models/community_channel_model.dart';
import 'package:ezycourse_community/features/community/data/models/community_list_response_model.dart';
import 'package:ezycourse_community/features/community/data/models/feed_comment_model.dart';
import 'package:ezycourse_community/features/community/data/models/feed_model.dart';
import 'package:ezycourse_community/features/community/data/models/gallery_item_model.dart';

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

  @override
  Future<List<FeedModel>> getCommunityFeeds({
    required final String token,
    required final String url,
  }) async {
    final response = await networkService.get(url: url, token: token);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as List;
      return jsonData.map((json) => FeedModel.fromJson(json)).toList();
    } else {
      throw AppException(
        'Failed to load feeds',
        statusCode: response.statusCode,
      );
    }
  }

  @override
  Future<List<CommunityChannelModel>> getCommunityChannels({
    required final String token,
    required final String url,
  }) async {
    final response = await networkService.get(url: url, token: token);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as List;
      return jsonData
          .map((x) => CommunityChannelModel.fromJson(x))
          .toList();
    } else {
      throw AppException(
        'Failed to load channels',
        statusCode: response.statusCode,
      );
    }
  }

  @override
  Future<void> createPost({
    required final String? token,
    required final String url,
    required final Map<String, dynamic> body,
  }) async {
    final response =
        await networkService.post(body: body, token: token, url: url);

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw AppException(
        'Failed to create post (${response.statusCode}): ${response.body}',
        statusCode: response.statusCode,
      );
    }
  }

  @override
  Future<void> createFeedComment({
    required final String? token,
    required final String url,
    required final Map<String, dynamic> body,
  }) async {
    final response =
        await networkService.post(body: body, token: token, url: url);

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw AppException(
        'Failed to create comment',
        statusCode: response.statusCode,
      );
    }
  }

  @override
  Future<void> createPostReact({
    required final String? token,
    required final String url,
    required final Map<String, dynamic> body,
  }) async {
    final response =
        await networkService.post(body: body, token: token, url: url);

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw AppException(
        'Failed to create reaction',
        statusCode: response.statusCode,
      );
    }
  }

  @override
  Future<List<FeedCommentModel>> getFeedComments({
    required final String token,
    required final String url,
  }) async {
    final response = await networkService.get(url: url, token: token);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as List;
      return jsonData
          .map((x) => FeedCommentModel.fromJson(x))
          .toList();
    } else {
      throw AppException(
        'Failed to load comments',
        statusCode: response.statusCode,
      );
    }
  }

  @override
  Future<List<GalleryItemModel>> getGalleryItems({
    required final String token,
    required final String url,
  }) async {
    final response = await networkService.get(url: url, token: token);

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List dataList;
      if (decoded is List) {
        dataList = decoded;
      } else if (decoded is Map) {
        dataList = decoded['data'] as List? ?? [];
      } else {
        dataList = [];
      }
      return dataList
          .map((json) => GalleryItemModel.fromJson(json))
          .toList();
    } else {
      throw AppException(
        'Failed to load gallery items',
        statusCode: response.statusCode,
      );
    }
  }

  @override
  Future<void> uploadGalleryFile({
    required final String token,
    required final String url,
    required final String filePath,
  }) async {
    final file = await http.MultipartFile.fromPath('file', filePath);
    final response = await networkService.multipartPost(
      url: url,
      token: token,
      fields: {},
      files: [file],
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw AppException(
        'Failed to upload file',
        statusCode: response.statusCode,
      );
    }
  }
}
