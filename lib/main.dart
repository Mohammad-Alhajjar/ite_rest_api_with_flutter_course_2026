import 'package:auth_example/core/config/di.dart';
import 'package:auth_example/views/login_view.dart';
import 'package:auth_example/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: getIt.get<SharedPreferences>().getString('token') == null
          ? LoginView()
          : ProfileView(),
    );
  }
}
