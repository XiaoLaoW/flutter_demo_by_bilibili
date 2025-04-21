import 'package:flutter/cupertino.dart';

import '../../constans.dart';
import '../../repository/api.dart';
import '../../utils/sp_utils.dart';

class PersonalVM extends ChangeNotifier {
  String? username ;
  bool shouldLogin = true;

  Future initData() async {
    SpUtils.getString(Constants.USER_NAME).then((value) {
      if (value != null && value != "") {
        username = value;
        shouldLogin = false;
      } else {
        username = "未登录";
        shouldLogin = true;
      }
      notifyListeners();
    });
  }

  Future logout() async {
    bool? success = await Api.instance.logout();
    if (success == true) {
      SpUtils.removeAll();
      username = "未登录";
      shouldLogin = true;
      notifyListeners();
    }
  }
}