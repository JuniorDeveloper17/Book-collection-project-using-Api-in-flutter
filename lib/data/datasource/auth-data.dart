import 'package:dio/dio.dart';

class AuthDataSource {
  
  Future login({required String email, required String password}) async {
    Dio dio = Dio();
    String url = "https://book-crud-service-6dmqxfovfq-et.a.run.app/api/login";
    Map<String, dynamic> data = {"email": email, "password": password};
    try {
      Response response = await dio.post(url, data: data);
      if (response.data != null) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future register(
      {required String email,
      required String password,
      required String repasword,
      required String username}) async {
    Dio dio = Dio();
    String url =
        "https://book-crud-service-6dmqxfovfq-et.a.run.app/api/register";

    Map<String, dynamic> data = {
      "name": username,
      "email": email,
      "password": password,
      "password_confirmation": repasword
    };
    try {
      Response response = await dio.post(url, data: data);
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
