import 'package:dio/dio.dart';

const String serverIp = "http://172.20.10.3:2024/api/Query";

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: serverIp,
          receiveDataWhenStatusError: true,
          headers: {
            "Content-Type": "application/json",
          }),
    );
  }

  static Future<Response> postData({
    required dynamic data,
  }) async {
    dio!.options.headers = {
      "Content-Type": "application/json",
    };

    return dio!.post(
      serverIp,
      data: data,
    );
  }
}