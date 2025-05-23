import 'package:demo_by_bilibili/http/print_log_intercepter.dart';
import 'package:demo_by_bilibili/http/res_interceptor.dart';
import 'package:dio/dio.dart';

import 'cookie_interceptor.dart';
import 'http_method.dart';

class DioInstance {
  static DioInstance? _instance;

  DioInstance._();

  static DioInstance get instance {
    return _instance ??= DioInstance._();
  }

  final Dio _dio = Dio();
  final _defaultTime = const Duration(seconds: 30);

  void initDio({
    required String baseUrl,
    String? httpMethods = HttpMethod.GET,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
    ResponseType? responseType = ResponseType.json,
    String? contentType,
  }) {
    _dio.options = BaseOptions(
        method: httpMethods,
        baseUrl: baseUrl,
        connectTimeout: connectTimeout ?? _defaultTime,
        receiveTimeout: receiveTimeout ?? _defaultTime,
        sendTimeout: sendTimeout ?? _defaultTime,
        responseType: responseType,
        contentType: contentType);
    _dio.interceptors.add(CookieInterceptor());
    _dio.interceptors.add(PrintLogIntercepter());
    _dio.interceptors.add(ResponseInterceptor());
  }

  Future<Response> get({
    required String path,
    Map<String, dynamic>? param,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _dio.get(path,
        queryParameters: param,
        options: options ??
            Options(
              method: HttpMethod.GET,
              receiveTimeout: _defaultTime,
              sendTimeout: _defaultTime,
            ),
        cancelToken: cancelToken);
  }

  Future<Response> post({
    required String path,
    Object? data,
    Map<String, dynamic>? param,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _dio.post(path,
        queryParameters: param,
        data: data,
        options: options ??
            Options(
              method: HttpMethod.POST,
              receiveTimeout: _defaultTime,
              sendTimeout: _defaultTime,
            ),
        cancelToken: cancelToken);
  }
}
