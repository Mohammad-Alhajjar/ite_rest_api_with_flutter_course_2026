import 'package:get_it/get_it.dart';
import 'package:rest_api_with_getx/services/product_service.dart';

GetIt getIt = GetIt.instance;

Future<void> setup() async{
  getIt.registerSingleton(ProductService());
}
