class ApiEndpoints {
  static const String baseUrl = "https://ezyappteam.ezycourse.com/api/app";

  //authentication
  static const String login = "$baseUrl/student/auth/login";
  static const String logout = "$baseUrl/student/auth/logout";

  //channel
  static String channelList(int communityId) =>
      "$baseUrl/public/communities/$communityId/spaces";

  //community
  static String communityList(int page, int limit) =>
      '$baseUrl/student/community/getEnrolledCommunityList?page=$page&limit=$limit';
  static String communityFeed(int communityId, int spaceId) =>
      '$baseUrl/public/feeds/$communityId?space_id=$spaceId';
  static const String createPost = '$baseUrl/teacher/community/createFeed';

  //comments
  static String feedComments(int communityFeedId) =>
      '$baseUrl/student/comment/getComment/$communityFeedId';
  static String createFeedComment =
      '$baseUrl/student/comment/createComment';
}
