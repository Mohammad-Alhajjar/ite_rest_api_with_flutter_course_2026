import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_with_getx/core/config/di.dart';
import 'package:rest_api_with_getx/models/product_model.dart';
import 'package:rest_api_with_getx/services/product_service.dart';

class ProductController extends GetxController {
  bool isLoading = false;
  String? errorMessage;
  List<ProductModel> products = [];

  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

  void getAllProducts() async {
    isLoading = true;
    update();
    List<ProductModel>? result = await getIt.get<ProductService>().getAll();
    if (result != null) {
      products = result;
    } else {
      errorMessage = "failed to get data...";
    }
    isLoading = false;
    update();
  }

  Future<void> createNewProduct({required ProductModel newProduct}) async {
    isLoading = true;
    update();
    bool isCreated = await getIt.get<ProductService>().create(
      newItem: newProduct,
    );
    if (isCreated) {
      getAllProducts();
      // Get.snackbar(
      //   "Success",
      //   "data fetched successfuly...",
      //   titleText: Text("Success"),
      //   messageText: Text("data fetched successfuly..."),
      //   backgroundColor: Colors.green,
      // );
      print("done");
    } else {
      // Get.snackbar(
      //   "Error",
      //   "failed to create new product, try again",
      //   titleText: Text("Error"),
      //   messageText: Text("failed to create new product, try again"),
      //   backgroundColor: Colors.red,
      // );
      print("error");
    }
    isLoading = false;
    update();
  }
}
