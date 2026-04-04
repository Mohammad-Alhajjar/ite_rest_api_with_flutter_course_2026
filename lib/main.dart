import 'package:auth_example/views/login_view.dart';
import 'package:auth_example/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences storage;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  storage = await SharedPreferences.getInstance();
  // storage.remove('token');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: storage.getString("token") == null ? LoginView() : ProfileView(),
    );
  }
}
