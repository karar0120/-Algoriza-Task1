import 'package:dio/dio.dart';

class WebService {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(

        baseUrl: "https://student.valuxapps.com/api/",
        receiveDataWhenStatusError: true,
        receiveTimeout: 20 * 1000,
        connectTimeout: 20 * 1000));
  }

 static Future<Response> GetAllUsers({
    required String url,
   Map<String, dynamic>? query,
   String lang='en',
   String? token,
  }) async {
    dio.options.headers={
      "Content-Type": "application/json",
      'lang':lang,
      'Authorization':token,
    };
     return await dio.get(url, queryParameters: query);
    }

  static Future<Response> PostAllUser(
      {required String url, required Map<String, dynamic> data,String?token}) async {
    dio.options.headers={
      "Content-Type": "application/json",
      "lang":"en",
      "Authorization":token
    };
    return dio.post(
      url,
      data: data,
    );
  }
}
