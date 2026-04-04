import 'package:dio/dio.dart';

abstract class BaseService <T>{
  Dio dio = Dio();
  final String baseUrl = "https://69ce61b133a09f831b7d66ea.mockapi.io/api/v1";
  late Response response;

  Future<List<T>?> getAll();
  Future<T?> getOne({required String itemId});
  Future<bool> create({required T newItem});
  Future<bool> update({required T updatedItem});
  Future<bool> delete({required String deleteItemId});
}
