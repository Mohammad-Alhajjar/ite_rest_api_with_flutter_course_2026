import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:rest_api_session_2/models/laptop_model.dart';

// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
class LaptopService {
  Future<List<LaptopModel>?> getAllLaptop() async {
    Dio dio = Dio();
    try {
      Response response = await dio.get(
        "https://69ce61b133a09f831b7d66ea.mockapi.io/api/v1/laptop",
      );
      if (response.statusCode == 200) {
        List<LaptopModel> laptops = [];
        for (int i = 0; i < response.data.length; i++) {
          LaptopModel laptop = LaptopModel.fromMap(response.data[i]);
          laptops.add(laptop);
        }
        return laptops;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

Future<LaptopModel?>  getOnelaptop({required int laptopId}) async {
    Dio dio = Dio();
    try {
      Response response = await dio.get(
        "https://69ce61b133a09f831b7d66ea.mockapi.io/api/v1/laptop/$laptopId",
      );
      if (response.statusCode == 200) {
        LaptopModel laptop = LaptopModel.fromMap(response.data);
        return laptop;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}

// ! Http Code
// Future<List<dynamic>?> getLaptopWithHttp() async {
//   Uri uri = Uri.parse("https://69ce61b133a09f831b7d66ea.mockapi.io/api/v1/laptop");
//   try {
//     Response response = await http.get(uri);
//     List<dynamic> dataList = jsonDecode(response.body);
//     return dataList;
//   } catch (e) {
//     print(e);
//     return null;
//   }
// }
