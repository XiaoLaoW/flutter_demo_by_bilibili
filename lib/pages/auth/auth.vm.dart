import 'package:flutter/cupertino.dart';

import '../../repository/api.dart';

class AuthViewModel with ChangeNotifier{
  RegisterInfo registerInfo = RegisterInfo();

  Future<bool> fetchRegister () async {
    print("fetchRegister---${registerInfo.name} ${ registerInfo.password} ${ registerInfo.repassword}");
    if(registerInfo.name != null && registerInfo.password != null && registerInfo.repassword != null) {
      await Api.instance.register(registerInfo.name, registerInfo.password, registerInfo.repassword);
      return true;
    }
    return false;
  }
}

class RegisterInfo {
  String? name;
  String? password;
  String? repassword;
}