import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class APILogInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('');
    debugPrint('==== ERROR ====');
    debugPrint('<-- ${err.response?.statusCode} - ${err.requestOptions.uri}');
    debugPrint('Message: ${err.response?.data.toString()}');
    debugPrint('==== END ERROR ====');
    return super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      "Authorization" : "Bearer --token--"
    });
    debugPrint('');
    debugPrint('==== REQUEST ====');
    final method = options.method.toUpperCase();
    debugPrint('--> $method - ${options.uri}');
    debugPrint('Headers: ${options.headers}');
    debugPrint('Data: ${options.data.toString()}');
    debugPrint('==== END $method ====');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('');
    debugPrint('==== RESPONSE ====');
    debugPrint('<-- ${response.statusCode} - ${response.requestOptions.uri}');
    debugPrint('Data : ${response.data}');
    debugPrint('==== END RESPONSE ====');

    // if (response.data is Map<String, dynamic>) {
    //   response.data["domain"] = response.requestOptions.baseUrl;
    //   debugPrint("domain: ${response.data["domain"]}");
    // } else {
    //   debugPrint("Caution not Json");
    // }
    return super.onResponse(response, handler);
  }
}
