import 'package:flutter/material.dart';
import 'package:rest_api_with_getx/core/config/di.dart';
import 'package:rest_api_with_getx/views/products_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ProductsView());
  }
}
