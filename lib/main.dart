import 'package:flutter/material.dart';
import 'package:rest_api_session_2/pages/laptop_page_with_button.dart';
import 'package:rest_api_session_2/pages/laptop_page_with_future_builder.dart';

class A {
  int x;
  A(this.x);
  static test() {
    print("testing");
  }
}

void main() {
  A a = A(10);
  a.x;
  A.test();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LaptopPageWithFutureBuilder());
  }
}
