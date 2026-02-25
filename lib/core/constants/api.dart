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
  //create post
  static const String createPost = '$baseUrl/teacher/community/createFeed';

  //comments
  static String feedComments(int communityFeedId) =>
      '$baseUrl/student/comment/getComment/$communityFeedId';
  static String createFeedComment = '$baseUrl/student/comment/createComment';
  //react
  static String createPostReact = '$baseUrl/teacher/community/createLike';

  //gallery
  static String galleryItems(String galleryFileType) =>
      '$baseUrl/teacher/gallery/getGalleryItemsFromLibary?type=$galleryFileType&parent_id=0';
  static const String uploadImage = '$baseUrl/teacher/gallery/uploadFile';
  static const String uploadVideo = '$baseUrl/teacher/gallery/create-video';
}
