import 'package:dio/dio.dart';
import 'package:rest_api_session_3/core/resources/api_constants.dart';
import 'package:rest_api_session_3/core/services/base_service.dart';
import 'package:rest_api_session_3/models/laptop_model.dart';

class LaptopService extends BaseService<LaptopModel> {
  @override
  Future<List<LaptopModel>?> getAll() async {
    try {
      response = await dio.get("$baseUrl/${ApiConstants.laptop}");
      if (response.statusCode == 200) {
        List<LaptopModel> laptops = List.generate(response.data.length, (
          int index,
        ) {
          return LaptopModel.fromMap(response.data[index]);
        });
        return laptops;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<LaptopModel?> getOne({required String itemId}) async {
    try {
      response = await dio.get("$baseUrl/${ApiConstants.laptop}/$itemId");
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

  @override
  Future<bool> create({required LaptopModel newItem}) async {
    try {
      response = await dio.post(
        "$baseUrl/${ApiConstants.laptop}",
        data: newItem.toMap(),
      );
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<bool> update({required LaptopModel updatedItem}) async {
    try {
      response = await dio.put(
        "$baseUrl/${ApiConstants.laptop}/${updatedItem.id}",
        data: updatedItem.toMap(),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<bool> delete({required String deleteItemId}) async {
    try {
      response = await dio.delete(
        "$baseUrl/${ApiConstants.laptop}/$deleteItemId",
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
