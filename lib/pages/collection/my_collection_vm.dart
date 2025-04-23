import 'package:flutter/cupertino.dart';

import '../../common_ui/loading.dart';
import '../../repository/api.dart';
import '../../repository/datas/my_collection_data.dart';
import '../../utils/index.dart';

class MyCollectionVM extends ChangeNotifier {
  List<collectListData>? collectList = [];
  int _count = 0;
  bool isLast = false;

  Future fetchCollectList([bool? clear]) async {
    Loading.showLoading();
    if (clear == true) {
      collectList = [];
      _count = 0;
    }
    MyCollectionData data = await Api.instance.fetchCollectList(_count);
    collectList!.addAll(data.datas ?? []);
    isLast = data.over ?? true;
    notifyListeners();
    _count += 1;
    Loading.hideLoading();
  }

  Future cancelCollect(int id) async {
    Loading.showLoading();
    bool? result = await Api.instance.cancelCollect(id);
    Loading.hideLoading();
    ToastHelper.instance.showToast(result == true? "取消收藏成功" : "取消收藏失败");
    return result;
  }
}