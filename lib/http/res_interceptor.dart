import 'package:dio/dio.dart';

import '../utils/index.dart';
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
          }  else {
            handler.next(Response(requestOptions: response.requestOptions, data: rsp.data));
          }
        } else if (rsp.errorCode == -1001) {
          handler.reject(DioException(requestOptions: response.requestOptions, message: '未登录'));
          ToastHelper.instance.showToast('请先登录');
        } else if (rsp.errorCode == -1) {
          ToastHelper.instance.showToast(rsp.errorMsg as String);
        }
      } catch (e) {
        handler.reject(DioException(requestOptions: response.requestOptions, message: e.toString()));
      }
    } else {
      handler.reject(DioException(requestOptions: response.requestOptions));
    }
  }
}