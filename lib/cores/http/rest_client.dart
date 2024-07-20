import 'package:dio/dio.dart';

abstract class RestClient {
  Future<Response> get({required String path});
  Future<Response> post({required String path, dynamic body});
}
