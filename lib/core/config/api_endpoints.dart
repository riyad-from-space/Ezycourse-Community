class ApiEndpoints {
  static const String baseUrl = "https://demo1.ezycourse.com/api/app";

  //authentication
  static const String login = "$baseUrl/student/auth/login";
  static const String logout = "$baseUrl/student/auth/logout";

  //channel
  static String channelList(int communityId) => "$baseUrl/public/communities/$communityId/spaces";

  //community
  static const String communityList= '$baseUrl/student/community/getEnrolledCommunityList';
  static String communityFeed(int communityId,int spaceId) => '$baseUrl/public/feeds/$communityId?space_id=$spaceId';
  static const String createPost = '$baseUrl/teacher/community/createFeed';
}
