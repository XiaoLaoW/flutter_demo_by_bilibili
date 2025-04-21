import 'package:flutter/cupertino.dart';

import '../../constans.dart';
import '../../repository/api.dart';
import '../../repository/datas/auth_data.dart';
import '../../utils/index.dart';
import '../../utils/sp_utils.dart';

class AuthViewModel with ChangeNotifier{
  RegisterInfo registerInfo = RegisterInfo();
  LoginInfo loginInfo = LoginInfo();

  Future<bool?> fetchRegister () async {
    if(registerInfo.name != null && registerInfo.password != null && registerInfo.repassword != null) {
      dynamic response = await Api.instance.register(registerInfo.name, registerInfo.password, registerInfo.repassword);
      if (response is bool) {
        return response;
      } else {
        return true;
      }
    }
    return false;
  }

  Future<bool?> fetchLogin () async {
    if (loginInfo.name != null && loginInfo.password != null) {
      AuthData data = await Api.instance.login(
          loginInfo.name, loginInfo.password);
      if (data.username != null && data.username?.isNotEmpty == true) {
        SpUtils.saveString(Constants.USER_NAME, data.username!);
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  void setLoginInfo(String? name, String? password) {
    if (name != null) {
      loginInfo.name = name;
    }
    if (password != null) {
      loginInfo.password = password;
    }
  }
}

class RegisterInfo {
  String? name;
  String? password;
  String? repassword;
}

class LoginInfo {
  String? name;
  String? password;
}