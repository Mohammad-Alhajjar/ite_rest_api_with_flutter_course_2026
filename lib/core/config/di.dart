import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async{
  getIt.registerSingleton(await SharedPreferences.getInstance());
}
