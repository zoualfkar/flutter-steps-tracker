import 'dart:convert';
import 'package:dio/dio.dart';
import '../../common/data/models/error_model/error_model.dart';



ErrorModel errorParse(DioError? error, StackTrace stackTrace) {
  bool isBackendError = false;

  final int? statusCode = error?.response?.statusCode;

  if (statusCode != null && statusCode < 500) {
    isBackendError = true;
  }



  if (isBackendError) {

    final Map<String, dynamic> errorResponse =
        json.decode(error?.response?.data! as String) as Map<String, dynamic>;
    final ErrorModel backendErrorData = ErrorModel.fromJson(errorResponse);
    return backendErrorData;
  } else {
    const Error localError =  Error(message: "You are not connected to the network. Please check if your Wi-Fi is enabled and try again");
    const ErrorModel localErrorData = ErrorModel(error: localError);
    return localErrorData;
  }
}
