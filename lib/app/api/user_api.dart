import 'package:bloc/app/models/users.dart';
import 'package:dio/dio.dart';

class UserApi {
  UserApi._internal();

  static UserApi _instance = UserApi._internal();
  static UserApi get instance => _instance;

  final _dio = Dio();

  Future<List<User>> gexUser(int page) async {
    Response response = await _dio
        .get("https://reqres.in/api/users", queryParameters: {"page": page});

    return (response.data["data"] as List)
        .map((e) => User.fromJson(e))
        .toList();
  }
}
