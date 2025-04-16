import 'package:flutter/cupertino.dart';

import '../../repository/api.dart';
import '../../repository/datas/common_website_data.dart';
import '../../repository/datas/search_hot_key_data.dart';

class HotKeyViewModel extends ChangeNotifier {
  List<CommonWebsiteData>? websiteList;
  List<SearchHotKeyData>? SearchHotKeyList;

  Future getHotKey() async {
    List<CommonWebsiteData>? list = await Api.instance.getCommonWebsiteList();
    websiteList = list;
    notifyListeners();
  }

  Future getSearchHotKey() async {
    List<SearchHotKeyData>? list = await Api.instance.getSearchHotKeyList();
    SearchHotKeyList = list;
    notifyListeners();
  }
}