import 'package:auth_example/models/response_models/profile_model.dart';
import 'package:auth_example/services/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class ProfileService {
  Dio dio = Dio();
  Future<ProfileModel?> getProfile() async {
    try {
      
      Response response = await dio.get(
        "https://dummyjson.com/auth/me",
        options: Options(headers: {"Authorization": "Bearer ${storage.getString('token')}"}),
      );
      if (response.statusCode == 200) {
        ProfileModel profile = ProfileModel.fromMap(response.data);
        return profile;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
