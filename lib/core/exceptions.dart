import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServerException implements Exception {}

class CacheException implements Exception {}

class NetworkException implements Exception {}

///can be used for throwing [NoInternetException]
class NoInternetException implements Exception {
  late String _message;

  NoInternetException([String message = 'NoInternetException Occurred']) {

    Get.snackbar('Error', message);
    this._message = message;
  }

  @override
  String toString() {
    return _message;
  }
}

class ApiResponseException implements Exception {
  ApiResponseException(this.message, {this.code = "0"});

  final String message;
  final String code;

  String get errorMessage {
    return message;
  }

  String get errorCode {
    return code;
  }
}

class SessionExpiredException implements Exception {}