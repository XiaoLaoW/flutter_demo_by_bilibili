import 'dart:io';

import 'package:dio/dio.dart';

import '../utils/sp_utils.dart';

class CookieInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.requestOptions.path.contains('user/login')) {
      dynamic list = response.headers[HttpHeaders.setCookieHeader];
      List<String> cookies = [];
      print('-------cookies -----list: $list');
      if (list is List) {
        for (var item in list) {
          print('-------cookies -----item: $item');
          cookies.add(item);
        }
      }
      SpUtils.saveStringList('cookies', cookies);
    }
  }
}
