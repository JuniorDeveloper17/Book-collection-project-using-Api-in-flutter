import 'package:dio/dio.dart';

class UserDataSource {
  final String token;
  const UserDataSource({required this.token});

  Future getUserData() async {
    Dio dio = Dio();
    String url = "https://book-crud-service-6dmqxfovfq-et.a.run.app/api/user";
    try {
      dio.options.headers["Authorization"] = "Bearer $token";
      Response response = await dio.get(url);
      if (response.data != null) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future logout() async {
    Dio dio = Dio();
    String url =
        "https://book-crud-service-6dmqxfovfq-et.a.run.app/api/user/logout";
    try {
      dio.options.headers["Authorization"] = "Bearer $token";
      Response response = await dio.delete(url);
      if (response.data != null) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
