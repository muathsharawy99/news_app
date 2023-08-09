import 'package:dio/dio.dart';
import 'package:news/view_model/network/endPoints.dart';

class DioHelper {
  static late final dio;

  static initDio() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,

      ),
    );
  }
  static Future<Response> get(
      {required endPoint, Map<String, dynamic>? queryParams}) async {
    try {
      var response = await dio.get(endPoint, queryParameters: queryParams);
      return response;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
