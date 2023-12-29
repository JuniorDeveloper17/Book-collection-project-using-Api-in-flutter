import 'package:dio/dio.dart';
import 'package:test_msib1/data/model/buku-model.dart';

class BookDataSource {
  final String token;
  const BookDataSource({required this.token});

  Future insertBook({required Data data}) async {
    Dio dio = Dio();
    String url =
        "https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books/add";
    try {
      dio.options.headers["Authorization"] = "Bearer $token";
      Response response = await dio.post(url, data: data.toJson());
      if (response.data != null) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future getBook() async {
    Dio dio = Dio();
    String url = "https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books";
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

  Future getSpesifikBook({required int id}) async {
    Dio dio = Dio();
    String url =
        "https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books/$id";
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

  Future updateBook({required Data data, required int id}) async {
    Dio dio = Dio();
    String url =
        "https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books/$id" +
            "/edit";
    try {
      dio.options.headers["Authorization"] = "Bearer $token";
      Response response = await dio.put(url, data: data.toJson());

      if (response.data != null) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future deleteBook({required int id, required Data data}) async {
    Dio dio = Dio();
    String url =
        "https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books/$id";
    try {
      dio.options.headers["Authorization"] = "Bearer $token";
      Response response = await dio.delete(url, data: data.toJson());
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
