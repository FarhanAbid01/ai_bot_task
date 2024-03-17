import 'package:ai_bot_task/common/utils/pref_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';


class ApiLogging extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (kDebugMode) {
      print('REQUEST[${options.method}] => PATH: ${options.path}');
    }

    final token = {
      'token': PrefUtils().getUserToken(),
    };
    if (token['token'].toString().isNotEmpty) {
      options.headers.addAll({"Authorization": "Bearer ${token['token']}"});
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
      );
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
      );
    }
    super.onError(err, handler);
  }
}
