import 'package:dio/dio.dart';

import 'api_logging.dart';


class DioClient {
  final BaseOptions baseOptions = BaseOptions(
      baseUrl: "https://dev.newtype-backend.zazz.buzz/api",
      connectTimeout: Duration(seconds: 100),
      receiveTimeout: Duration(seconds: 100));

  late Dio dio;

  DioClient() {
    dio = Dio(baseOptions)..interceptors.add(ApiLogging());
  }
}


