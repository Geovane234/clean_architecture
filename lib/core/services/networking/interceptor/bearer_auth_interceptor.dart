import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class BearerAuthInterceptor extends Interceptor {
  BuildContext? context;
/// intercepts if the request must contain a token to be able to launch the request
  BearerAuthInterceptor({this.context});
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? authToken = "token_with_api";
    if (authToken != null) {
      options.headers.addAll({
        "Authorization": "Bearer $authToken",
      });
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }
}
