import 'package:dio/dio.dart';

abstract class BaseService<T> {
  Dio dio = Dio();
  final String baseUrl = "https://dummyjson.com";
  late Response response;

  Future<List<T>?> getAll();
  Future<T?> getOne({required int itemId});
  Future<bool> create({required T newItem});
  Future<bool> update({required T updateItem});
  Future<bool> delete({required int deleteItemId});
}
