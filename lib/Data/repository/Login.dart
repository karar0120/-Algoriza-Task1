import 'package:dio/dio.dart';
import 'package:shop/Constaness/end_point.dart';
import 'package:shop/Data/web_service/Login/Login.dart';

import '../../Modal/Login.dart';

class LoginRepostiry {
  static Future<Response> PostDatawhenLogin (
      {required String email, required String password}) {
    return WebService.PostAllUser(url: LOGIN, data: {
      "email": email,
      "password": password,
    });
  }

}
