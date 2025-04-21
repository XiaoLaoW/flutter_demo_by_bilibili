import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../repository/api.dart';
import '../../../repository/datas/knowledge_data.dart';
import '../../../repository/datas/knowledge_detail_list_data.dart';

class KnowledgeDetailVM  extends ChangeNotifier {
  List<Tab> tabs = [];
  List<detailListDatas>? knowledgeDetailListData = [];
  int page = 0;

  void initTabs(List<KnowledgeDataChildren>? tabList) {
    tabList?.forEach((element) {
      tabs.add(Tab(text: element.name));
    });
    notifyListeners();
  }

  Future fetchData(String? cid,bool loadMore) async {
    if (loadMore) {
      page++;
    } else {
      page = 0;
      knowledgeDetailListData?.clear();
    }
    List<detailListDatas>? list = await Api.instance.getKnowledgeDetailList(page,cid);
    if (list?.isNotEmpty == true) {
      knowledgeDetailListData = list;
      notifyListeners();
    } else {
      if (loadMore && page > 0) {
        page--;
      }
    }
  }
}