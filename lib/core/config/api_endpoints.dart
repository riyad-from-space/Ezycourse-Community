class ApiEndpoints {
  static const String baseUrl = "https://demo1.ezycourse.com/api/app";

  //authentication
  static const String login = "$baseUrl/student/auth/login";
  static const String logout = "$baseUrl/student/auth/logout";

  //community
  static const String communityList= '/student/community/getEnrolledCommunityList';
  static String communityFeed(int communityId,int spaceId) => '/public/feeds/$communityId?space_id=$spaceId';
  static const String createPost = '/teacher/community/createFeed';
}
