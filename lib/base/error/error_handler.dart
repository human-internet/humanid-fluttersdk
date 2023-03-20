import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:humanid_flutter_sdk/values/strings.dart';

import 'exceptions/api_exception.dart';
import 'exceptions/app_exception.dart';

Future errorHandler(dynamic error) {
  if (error is DioError) {
    DioError dioError = error;
    switch (dioError.type) {
      case DioErrorType.response:
        var error = dioError.response?.data;
        throw ApiException(error['message'], error['code']);
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw TimeoutException('Terjadi Kesalahan, Silahkan dicoba kembali')
            .message!;
      default:
        if (dioError.error is SocketException) {
          throw const SocketException(ERROR_INTERNET_CONNECTION_FAILED).message;
        } else if (dioError.error is FormatException) {
          throw const FormatException("Unable to process the data").message;
        } else {
          throw AppException(ERROR_SOMETHING_WRONG).message;
        }
    }
  } else {
    throw AppException(ERROR_SOMETHING_WRONG).message;
  }
}
