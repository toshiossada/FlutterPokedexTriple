import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // var userService = Modular.get<UserStore>();
    var token = '';
    //userService.user?.token ?? '';
    if (token.isNotEmpty) {
      var headerAuth = _genToken(token);
      options.headers['Authorization'] = headerAuth;
    }
    //Imprimindo informações do request para debug
    if (kDebugMode) {
      debugPrint(json.encode("BaseURL: ${options.baseUrl}"));
      debugPrint(json.encode("Endpoint: ${options.path}"));
      if (options.headers['Authorization'] != null) {
        debugPrint("Authorization: ${options.headers['Authorization']}");
      }
      if (options.data != null) {
        debugPrint("Payload ${json.encode(options.data)}");
      }
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 400) {
      return handler.next(err);
    }
    return handler.next(err);
  }

  String _genToken(String token) {
    return 'Bearer $token';
  }
}
