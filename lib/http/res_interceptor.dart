import 'package:dio/dio.dart';

import 'base_model.dart';

class ResponseInterceptor extends InterceptorsWrapper {
  @override
  void onResponse(Response response,ResponseInterceptorHandler handler) {
    if (response.statusCode == 200) {
      try {
        var rsp = BaseModel.fromJson(response.data);
        if(rsp.errorCode == 0) {
          if(rsp.data == null){
            handler.next(Response(requestOptions: response.requestOptions, data: true));
          } else if (rsp.errorCode == -1001) {
            handler.reject(DioException(requestOptions: response.requestOptions, message: '未登录'));
          } else {
            handler.next(Response(requestOptions: response.requestOptions, data: rsp.data));
          }
        }
      } catch (e) {
        handler.reject(DioException(requestOptions: response.requestOptions, message: e.toString()));
      }
    } else {
      handler.reject(DioException(requestOptions: response.requestOptions));
    }
  }
}