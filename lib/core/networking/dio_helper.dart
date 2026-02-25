// ignore_for_file: strict_top_level_inference

import 'package:dio/dio.dart';
import 'api_endpoints.dart';

class DioHelper {
  static Dio? dio;
  static initDio() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static getRequest({
    required String endpoint,
    required Map<String, dynamic> query,
  }) async {
    try {
      Response response = await dio!.get(endpoint, queryParameters: query);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
