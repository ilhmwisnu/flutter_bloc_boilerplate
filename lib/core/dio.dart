import 'package:dio/dio.dart';

import 'dio_interceptor.dart';

class AppDio {
  AppDio._();

  static Dio getDio({
    Map<String, dynamic> headers = const {},
    int? connectTimeout,
    int? receiveTimeout,
  }) {
    final dio = Dio(BaseOptions(
      baseUrl: "https://dumpi.vercel.app/api",
      headers: headers,
      connectTimeout:
          connectTimeout != null ? Duration(seconds: connectTimeout) : null,
      receiveTimeout:
          receiveTimeout != null ? Duration(seconds: receiveTimeout) : null,
      contentType: "application/json",
      responseType: ResponseType.json,
    ));

    final Map<String, dynamic> defaultHeaders = {
      "X-Requested-With": "XMLHttpRequest"
    };

    // override headers if needed
    defaultHeaders.addAll(headers);

    // apply new headers
    dio.options.headers.addAll(defaultHeaders);

    dio.interceptors.add(APILogInterceptor());

    return dio;
  }
}

final restClient = AppDio.getDio();