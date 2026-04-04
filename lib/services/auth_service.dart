import 'package:auth_example/models/request_models/login_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

String token = '';

class AuthService {
  Dio dio = Dio();
  Future<bool> login({required LoginModel loginInfo}) async {
    try {
      Response response = await dio.post(
        "https://dummyjson.com/auth/login",
        data: loginInfo.toMap(),
      );
      if (response.statusCode == 200) {
        print(response.data);
        // token = response.data["accessToken"];
        storage.setString('token', response.data["accessToken"]);
        print(token);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  void signup() {}
  void signout() {}
}
