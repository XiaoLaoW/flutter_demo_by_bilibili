import 'package:flutter/cupertino.dart';

import '../../repository/api.dart';
import '../../repository/datas/knowledge_data.dart';

class KnowledgeViewModel extends ChangeNotifier {
  List<KnowledgeData>? knowledgeDataList = [];

  Future fetchKnowledgeData() async {
    List<KnowledgeData>? list = await Api.instance.knowLedge();
    knowledgeDataList = list;
    notifyListeners();
  }

  String generateSubTitle(List<KnowledgeDataChildren>? children) {
    if (children == null || children.isEmpty) {
      return "";
    }
    StringBuffer subTitle = StringBuffer("");
    for (var element in children) {
      subTitle.write("${element.name}");
    }
    return subTitle.toString();
  }
}