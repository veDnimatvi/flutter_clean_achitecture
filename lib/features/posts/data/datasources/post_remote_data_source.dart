import '../../../../core/api/dio_client.dart';
import '../models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getPosts();
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final DioClient dioClient;

  PostRemoteDataSourceImpl(this.dioClient);

  @override
  Future<List<PostModel>> getPosts() async {
    final response = await dioClient.get('/posts');
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((json) => PostModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Server Error');
    }
  }
}
