import 'package:dio/dio.dart';
import 'package:evon/common/constanst.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DioSettings {
  static final DioSettings _singleton = DioSettings._internal();

  factory DioSettings() {
    return _singleton;
  }

  DioSettings._internal();

  Dio get dio => _dio;

  final _dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: 3000,
      receiveTimeout: 3000,
    ),
  );

  void init() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) => _handleError(e, handler),
    ));
  }

  _handleError(DioError e, ErrorInterceptorHandler handler) {
    handler.next(e);
    // Show error with toast
    Fluttertoast.showToast(
      msg: e.response?.data.toString() ?? e.message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
