import 'package:flutter/cupertino.dart';

import '../../repository/api.dart';
import '../../repository/datas/search_data.dart';

class SearchVM extends ChangeNotifier {
  int? page = 0;
  List<searchListData>? searchData = [];
  Future search(String? searchText) async {
    List<searchListData>? list = await Api.instance.fetchSearchData(searchText,page);
    searchData = list;
    notifyListeners();
  }
}