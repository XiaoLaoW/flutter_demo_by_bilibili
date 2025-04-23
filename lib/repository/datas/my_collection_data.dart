/// curPage : 1
/// datas : [{"author":"","chapterId":502,"chapterName":"自助","courseId":13,"desc":"","envelopePic":"","id":352345,"link":"https://mp.weixin.qq.com/s/k2YwckiqIpwnS9wFYtPKNA","niceDate":"1 天前","origin":"","originId":29932,"publishTime":1745214787000,"title":"鸿蒙组件样式封装","userId":167402,"visible":0,"zan":0},{"author":"","chapterId":502,"chapterName":"自助","courseId":13,"desc":"","envelopePic":"","id":352338,"link":"https://juejin.cn/post/7493449430789095476","niceDate":"1 天前","origin":"","originId":29910,"publishTime":1745206851000,"title":"Android下载进度百分比按钮， Compose轻松秒杀实现","userId":167402,"visible":0,"zan":0}]
/// offset : 0
/// over : true
/// pageCount : 1
/// size : 20
/// total : 2

class MyCollectionData {
  MyCollectionData({
      num? curPage, 
      List<collectListData>? datas,
      num? offset, 
      bool? over, 
      num? pageCount, 
      num? size, 
      num? total,}){
    _curPage = curPage;
    _datas = datas;
    _offset = offset;
    _over = over;
    _pageCount = pageCount;
    _size = size;
    _total = total;
}

  MyCollectionData.fromJson(dynamic json) {
    _curPage = json['curPage'];
    if (json['datas'] != null) {
      _datas = [];
      json['datas'].forEach((v) {
        _datas?.add(collectListData.fromJson(v));
      });
    }
    _offset = json['offset'];
    _over = json['over'];
    _pageCount = json['pageCount'];
    _size = json['size'];
    _total = json['total'];
  }
  num? _curPage;
  List<collectListData>? _datas;
  num? _offset;
  bool? _over;
  num? _pageCount;
  num? _size;
  num? _total;
MyCollectionData copyWith({  num? curPage,
  List<collectListData>? datas,
  num? offset,
  bool? over,
  num? pageCount,
  num? size,
  num? total,
}) => MyCollectionData(  curPage: curPage ?? _curPage,
  datas: datas ?? _datas,
  offset: offset ?? _offset,
  over: over ?? _over,
  pageCount: pageCount ?? _pageCount,
  size: size ?? _size,
  total: total ?? _total,
);
  num? get curPage => _curPage;
  List<collectListData>? get datas => _datas;
  num? get offset => _offset;
  bool? get over => _over;
  num? get pageCount => _pageCount;
  num? get size => _size;
  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['curPage'] = _curPage;
    if (_datas != null) {
      map['datas'] = _datas?.map((v) => v.toJson()).toList();
    }
    map['offset'] = _offset;
    map['over'] = _over;
    map['pageCount'] = _pageCount;
    map['size'] = _size;
    map['total'] = _total;
    return map;
  }

}

/// author : ""
/// chapterId : 502
/// chapterName : "自助"
/// courseId : 13
/// desc : ""
/// envelopePic : ""
/// id : 352345
/// link : "https://mp.weixin.qq.com/s/k2YwckiqIpwnS9wFYtPKNA"
/// niceDate : "1 天前"
/// origin : ""
/// originId : 29932
/// publishTime : 1745214787000
/// title : "鸿蒙组件样式封装"
/// userId : 167402
/// visible : 0
/// zan : 0

class collectListData {
  collectListData({
      String? author, 
      num? chapterId, 
      String? chapterName, 
      num? courseId, 
      String? desc, 
      String? envelopePic, 
      num? id, 
      String? link, 
      String? niceDate, 
      String? origin, 
      num? originId, 
      num? publishTime, 
      String? title, 
      num? userId, 
      num? visible, 
      num? zan,}){
    _author = author;
    _chapterId = chapterId;
    _chapterName = chapterName;
    _courseId = courseId;
    _desc = desc;
    _envelopePic = envelopePic;
    _id = id;
    _link = link;
    _niceDate = niceDate;
    _origin = origin;
    _originId = originId;
    _publishTime = publishTime;
    _title = title;
    _userId = userId;
    _visible = visible;
    _zan = zan;
}

  collectListData.fromJson(dynamic json) {
    _author = json['author'];
    _chapterId = json['chapterId'];
    _chapterName = json['chapterName'];
    _courseId = json['courseId'];
    _desc = json['desc'];
    _envelopePic = json['envelopePic'];
    _id = json['id'];
    _link = json['link'];
    _niceDate = json['niceDate'];
    _origin = json['origin'];
    _originId = json['originId'];
    _publishTime = json['publishTime'];
    _title = json['title'];
    _userId = json['userId'];
    _visible = json['visible'];
    _zan = json['zan'];
  }
  String? _author;
  num? _chapterId;
  String? _chapterName;
  num? _courseId;
  String? _desc;
  String? _envelopePic;
  num? _id;
  String? _link;
  String? _niceDate;
  String? _origin;
  num? _originId;
  num? _publishTime;
  String? _title;
  num? _userId;
  num? _visible;
  num? _zan;
collectListData copyWith({  String? author,
  num? chapterId,
  String? chapterName,
  num? courseId,
  String? desc,
  String? envelopePic,
  num? id,
  String? link,
  String? niceDate,
  String? origin,
  num? originId,
  num? publishTime,
  String? title,
  num? userId,
  num? visible,
  num? zan,
}) => collectListData(  author: author ?? _author,
  chapterId: chapterId ?? _chapterId,
  chapterName: chapterName ?? _chapterName,
  courseId: courseId ?? _courseId,
  desc: desc ?? _desc,
  envelopePic: envelopePic ?? _envelopePic,
  id: id ?? _id,
  link: link ?? _link,
  niceDate: niceDate ?? _niceDate,
  origin: origin ?? _origin,
  originId: originId ?? _originId,
  publishTime: publishTime ?? _publishTime,
  title: title ?? _title,
  userId: userId ?? _userId,
  visible: visible ?? _visible,
  zan: zan ?? _zan,
);
  String? get author => _author;
  num? get chapterId => _chapterId;
  String? get chapterName => _chapterName;
  num? get courseId => _courseId;
  String? get desc => _desc;
  String? get envelopePic => _envelopePic;
  num? get id => _id;
  String? get link => _link;
  String? get niceDate => _niceDate;
  String? get origin => _origin;
  num? get originId => _originId;
  num? get publishTime => _publishTime;
  String? get title => _title;
  num? get userId => _userId;
  num? get visible => _visible;
  num? get zan => _zan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['author'] = _author;
    map['chapterId'] = _chapterId;
    map['chapterName'] = _chapterName;
    map['courseId'] = _courseId;
    map['desc'] = _desc;
    map['envelopePic'] = _envelopePic;
    map['id'] = _id;
    map['link'] = _link;
    map['niceDate'] = _niceDate;
    map['origin'] = _origin;
    map['originId'] = _originId;
    map['publishTime'] = _publishTime;
    map['title'] = _title;
    map['userId'] = _userId;
    map['visible'] = _visible;
    map['zan'] = _zan;
    return map;
  }

}