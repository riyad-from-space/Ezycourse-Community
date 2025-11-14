import 'dart:convert';
import 'package:ezycourse_community/core/services/network_service.dart';
import 'package:ezycourse_community/features/community/data/models/feed_model.dart';
import 'package:ezycourse_community/features/community/domain/entities/feed_entity.dart';

/// Repository implementation for community feed operations
class CommunityRepository {
  final NetworkService networkService;

  CommunityRepository(this.networkService);

  /// Fetch feed list from API
  /// Returns a list of FeedEntity (domain objects)
  Future<List<FeedEntity>> getFeedList({
    required String token,
    int communityId = 2914, // Your community ID from the JSON
    int spaceId = 5883, // Your space ID from the JSON
  }) async {
    try {
      // Make POST request as per API documentation
      final response = await networkService.post(
        'teacher/community/getFeed?status=feed&',
        token: token,
        body: {
          'community_id': communityId,
          'space_id': spaceId, // Fixed: was 'spacae_id' (typo)
        },
      );

      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final dynamic jsonData = jsonDecode(response.body);
        
        // Handle if response is an array
        if (jsonData is List) {
          return jsonData
              .map((json) => FeedModel.fromJson(json).toEntity())
              .toList();
        }
        
        // Handle if response is an object with data field
        if (jsonData is Map<String, dynamic>) {
          if (jsonData['data'] is List) {
            return (jsonData['data'] as List)
                .map((json) => FeedModel.fromJson(json).toEntity())
                .toList();
          }
          
          // Handle if single feed returned
          if (jsonData.containsKey('id')) {
            return [FeedModel.fromJson(jsonData).toEntity()];
          }
        }
        
        throw Exception('Unexpected response format');
      } else {
        throw Exception('Failed to load feeds: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching feeds: $e');
      rethrow;
    }
  }

  /// Create a new feed post
  Future<FeedEntity> createFeed({
    required String token,
    required int communityId,
    required String text,
    List<String>? fileUrls,
    String? backgroundColor,
  }) async {
    try {
      final response = await networkService.post(
        'teacher/community/createFeed',
        token: token,
        body: {
          'community_id': communityId,
          'feed_txt': text,
          if (fileUrls != null && fileUrls.isNotEmpty) 'files': fileUrls,
          if (backgroundColor != null) 'bg_color': backgroundColor,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonData = jsonDecode(response.body);
        return FeedModel.fromJson(jsonData).toEntity();
      } else {
        throw Exception('Failed to create feed: ${response.statusCode}');
      }
    } catch (e) {
      print('Error creating feed: $e');
      rethrow;
    }
  }

  /// Toggle like on a feed
  Future<bool> toggleLike({
    required String token,
    required int feedId,
    String reactionType = 'LIKE',
  }) async {
    try {
      final response = await networkService.post(
        'teacher/community/toggleLike',
        token: token,
        body: {
          'feed_id': feedId,
          'reaction_type': reactionType,
        },
      );

      return response.statusCode == 200;
    } catch (e) {
      rethrow;
    }
  }
}
