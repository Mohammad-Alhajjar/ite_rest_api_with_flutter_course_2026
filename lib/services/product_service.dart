import 'package:flutter/material.dart';
import 'package:rest_api_with_getx/core/services/base_service.dart';
import 'package:rest_api_with_getx/models/product_model.dart';

class ProductService extends BaseService<ProductModel> {
  @override
  Future<bool> create({required ProductModel newItem}) async {
    try {
      response = await dio.post(
        "https://dummyjson.com/prod",
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
  Future<bool> delete({required int deleteItemId}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>?> getAll() async {
    try {
      response = await dio.get("$baseUrl/products");
      if (response.statusCode == 200) {
        List<ProductModel> products = List.generate(
          response.data["products"].length,
          (index) => ProductModel.fromMap(response.data["products"][index]),
        );
        return products;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<ProductModel?> getOne({required int itemId}) {
    // TODO: implement getOne
    throw UnimplementedError();
  }

  @override
  Future<bool> update({required ProductModel updateItem}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
