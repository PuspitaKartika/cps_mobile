import 'package:cps_mobile/cores/http/rest_client.dart';
import 'package:cps_mobile/cores/utils/constant/api.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class RestClientImpl implements RestClient {
  final Dio dioClient;
  final Logger logger;
  RestClientImpl({required this.dioClient, required this.logger});

  @override
  Future<Response> get({
    required String path,
  }) async {
    try {
      final result = await dioClient.get("$baseUrl$path");
      logger.i("RESPONSE: ${result.data}");
      return result;
    } catch (e) {
      logger.e("ERROR : $e");
      rethrow;
    }
  }

  @override
  Future<Response> post({
    required String path,
    body,
  }) async {
    try {
      final result = await dioClient.post("$baseUrl$path", data: body);
      logger.i("RESPONSE: ${result.data}");
      return result;
    } catch (e) {
      logger.e("ERROR : $e");
      rethrow;
    }
  }
}
