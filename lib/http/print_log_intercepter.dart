import 'dart:developer';

import 'package:dio/dio.dart';

class PrintLogIntercepter extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options,RequestInterceptorHandler handler) {
    log("\nRequest----------------");
    options.headers.forEach((k,v) => log("$k: $v"));
    log("url: ${options.uri}");
    log("method: ${options.method}");
    log("data: ${options.data}");
    log("queryParameters: ${options.queryParameters.toString()}");
    log("----------------\nRequest");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response,ResponseInterceptorHandler handler) {
    log("\nresponse----------------");
    response.headers.forEach((k,v) => log("$k: $v"));
    log("url: ${response.realUri}");
    log("method: ${response.statusCode}");
    log("data: ${response.statusMessage}");
    log("queryParameters: ${response.extra.toString()}");
    log("response: ${response.data}");
    log("----------------\nresponse");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err,ErrorInterceptorHandler handler) {
    log("\nerr----------------");
    log("queryParameters: ${err.toString()}");
    log("----------------\nerr");
    super.onError(err, handler);
  }
}