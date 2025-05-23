/// id : 6
/// link : ""
/// name : "面试"
/// order : 1
/// visible : 1

class SearchHotKeyListData {
  List<SearchHotKeyData>? SearchHotKeyList;
  SearchHotKeyListData.fromJson(dynamic json) {
    SearchHotKeyList = [];
    for (var item in json) {
      SearchHotKeyList!.add(SearchHotKeyData.fromJson(item));
      }
  }
}

class SearchHotKeyData {
  SearchHotKeyData({
      num? id, 
      String? link, 
      String? name, 
      num? order, 
      num? visible,}){
    _id = id;
    _link = link;
    _name = name;
    _order = order;
    _visible = visible;
}

  SearchHotKeyData.fromJson(dynamic json) {
    _id = json['id'];
    _link = json['link'];
    _name = json['name'];
    _order = json['order'];
    _visible = json['visible'];
  }
  num? _id;
  String? _link;
  String? _name;
  num? _order;
  num? _visible;
SearchHotKeyData copyWith({  num? id,
  String? link,
  String? name,
  num? order,
  num? visible,
}) => SearchHotKeyData(  id: id ?? _id,
  link: link ?? _link,
  name: name ?? _name,
  order: order ?? _order,
  visible: visible ?? _visible,
);
  num? get id => _id;
  String? get link => _link;
  String? get name => _name;
  num? get order => _order;
  num? get visible => _visible;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['link'] = _link;
    map['name'] = _name;
    map['order'] = _order;
    map['visible'] = _visible;
    return map;
  }

}