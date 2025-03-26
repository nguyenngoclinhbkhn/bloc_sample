import 'package:sample_bloc/data/network/base/param.dart';

class PostParam extends ApiParam {
  @override
  ApiName get name => ApiName.postsGet;

  @override
  String get path => 'posts';
}
