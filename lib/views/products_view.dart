import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:rest_api_with_getx/controllers/product_controller.dart';
import 'package:rest_api_with_getx/models/product_model.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<ProductController>().createNewProduct(newProduct: ProductModel(title: "new product"));
        },
        child: Icon(Icons.add),
      ),
      body: GetBuilder(
        init: ProductController(),
        builder: (productController) {
          if (productController.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (productController.errorMessage != null) {
              return Center(child: Text(productController.errorMessage!));
            } else {
              return ListView.builder(
                itemCount: productController.products.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Image.network(
                        productController.products[index].thumbnail!,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.warning),
                      ),
                      title: Text(
                        productController.products[index].title ??
                            'unknown title',
                      ),
                      subtitle: Text(
                        productController.products[index].description ??
                            'unknow description',
                      ),
                      trailing: Text(
                        "${productController.products[index].price}\$",
                      ),
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
