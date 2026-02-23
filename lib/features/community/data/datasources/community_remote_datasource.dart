import 'package:ezycourse_community/features/community/data/models/community_list_response_model.dart';

abstract interface class CommunityRemoteDatasource {
  //Enrolled communities from remote api
  Future<CommunityListResponseModel> getEnrolledCommunities({
    required final String token,

    required final String url,
  });
}
