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
      print(e.toString() as num);
    }
  }
}
