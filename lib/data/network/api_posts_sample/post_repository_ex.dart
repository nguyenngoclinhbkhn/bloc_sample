import 'package:sample_bloc/data/network/api_posts_sample/post_param.dart';
import 'package:sample_bloc/data/network/api_posts_sample/post_response.dart';
import 'package:sample_bloc/data/network/base/repository.dart';

extension PostRepositoryEx on ApiRepository {
  Future<PostResponse> getPostResponse() async {
    final response = await provider.requestApi(param: PostParam());
    return PostResponse.fromJsonList(response);
  }
}
