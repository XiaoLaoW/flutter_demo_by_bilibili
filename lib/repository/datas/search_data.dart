/// curPage : 1
/// datas : [{"adminAdd":false,"apkLink":"","audit":1,"author":"张鸿洋","canEdit":false,"chapterId":543,"chapterName":"Android技术周报","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":29929,"isAdminAdd":false,"link":"https://www.wanandroid.com/blog/show/3762","niceDate":"2025-04-19 00:00","niceShareDate":"2025-04-19 00:10","origin":"","prefix":"","projectLink":"","publishTime":1744992000000,"realSuperChapterId":542,"selfVisible":0,"shareDate":1744992600000,"shareUser":"","superChapterId":543,"superChapterName":"技术周报","tags":[],"title":"Android 技术周刊 （2025-04-<em class='highlight'>1</em>2 ~ 2025-04-<em class='highlight'>1</em>9）","type":0,"userId":-1,"visible":1,"zan":0},{"adminAdd":false,"apkLink":"","audit":1,"author":"张鸿洋","canEdit":false,"chapterId":543,"chapterName":"Android技术周报","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":29891,"isAdminAdd":false,"link":"https://www.wanandroid.com/blog/show/3760","niceDate":"2025-04-12 00:00","niceShareDate":"2025-04-12 00:10","origin":"","prefix":"","projectLink":"","publishTime":1744387200000,"realSuperChapterId":542,"selfVisible":0,"shareDate":1744387800000,"shareUser":"","superChapterId":543,"superChapterName":"技术周报","tags":[],"title":"Android 技术周刊 （2025-04-05 ~ 2025-04-<em class='highlight'>1</em>2）","type":0,"userId":-1,"visible":1,"zan":0},{"adminAdd":false,"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":494,"chapterName":"广场","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":29890,"isAdminAdd":false,"link":"https://juejin.cn/post/7491785600217317426","niceDate":"2025-04-11 18:06","niceShareDate":"2025-04-11 18:06","origin":"","prefix":"","projectLink":"","publishTime":1744366006000,"realSuperChapterId":493,"selfVisible":0,"shareDate":1744366006000,"shareUser":"congduan1","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"【Harmony】ArkUI全局设置窗口背景颜色、页面背景颜色","type":0,"userId":167199,"visible":0,"zan":0},{"adminAdd":false,"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":494,"chapterName":"广场","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":29888,"isAdminAdd":false,"link":"https://juejin.cn/post/7367253337418006567","niceDate":"2025-04-11 12:23","niceShareDate":"2025-04-11 12:23","origin":"","prefix":"","projectLink":"","publishTime":1744345425000,"realSuperChapterId":493,"selfVisible":0,"shareDate":1744345425000,"shareUser":"congduan1","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"【IM】flutter 仿微信发送语音按钮和页面","type":0,"userId":167199,"visible":0,"zan":0},{"adminAdd":false,"apkLink":"","audit":1,"author":"谷歌开发者","canEdit":false,"chapterId":415,"chapterName":"谷歌开发者","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":29897,"isAdminAdd":false,"link":"https://mp.weixin.qq.com/s/llhbnj8AsWH6MvrguNNuzQ","niceDate":"2025-03-24 00:00","niceShareDate":"2025-04-12 17:57","origin":"","prefix":"","projectLink":"","publishTime":1742745600000,"realSuperChapterId":407,"selfVisible":0,"shareDate":1744451840000,"shareUser":"","superChapterId":408,"superChapterName":"公众号","tags":[{"name":"公众号","url":"/wxarticle/list/415/1"}],"title":"自适应的未来：Android <em class='highlight'>1</em>6 中对屏幕方向和可调整大小 API 的更改","type":0,"userId":-1,"visible":1,"zan":0},{"adminAdd":false,"apkLink":"","audit":1,"author":"张鸿洋","canEdit":false,"chapterId":543,"chapterName":"Android技术周报","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":29703,"isAdminAdd":false,"link":"https://www.wanandroid.com/blog/show/3754","niceDate":"2025-03-22 00:00","niceShareDate":"2025-03-22 00:10","origin":"","prefix":"","projectLink":"","publishTime":1742572800000,"realSuperChapterId":542,"selfVisible":0,"shareDate":1742573400000,"shareUser":"","superChapterId":543,"superChapterName":"技术周报","tags":[],"title":"Android 技术周刊 （2025-03-<em class='highlight'>1</em>5 ~ 2025-03-22）","type":0,"userId":-1,"visible":1,"zan":0},{"adminAdd":false,"apkLink":"","audit":1,"author":"张鸿洋","canEdit":false,"chapterId":543,"chapterName":"Android技术周报","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":29664,"isAdminAdd":false,"link":"https://www.wanandroid.com/blog/show/3752","niceDate":"2025-03-15 00:00","niceShareDate":"2025-03-15 00:10","origin":"","prefix":"","projectLink":"","publishTime":1741968000000,"realSuperChapterId":542,"selfVisible":0,"shareDate":1741968600000,"shareUser":"","superChapterId":543,"superChapterName":"技术周报","tags":[],"title":"Android 技术周刊 （2025-03-08 ~ 2025-03-<em class='highlight'>1</em>5）","type":0,"userId":-1,"visible":1,"zan":0}]
/// offset : 0
/// over : false
/// pageCount : 166
/// size : 10
/// total : 1651

class SearchData {
  SearchData({
      num? curPage, 
      List<searchListData>? datas,
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

  SearchData.fromJson(dynamic json) {
    _curPage = json['curPage'];
    if (json['datas'] != null) {
      _datas = [];
      json['datas'].forEach((v) {
        _datas?.add(searchListData.fromJson(v));
      });
    }
    _offset = json['offset'];
    _over = json['over'];
    _pageCount = json['pageCount'];
    _size = json['size'];
    _total = json['total'];
  }
  num? _curPage;
  List<searchListData>? _datas;
  num? _offset;
  bool? _over;
  num? _pageCount;
  num? _size;
  num? _total;
SearchData copyWith({  num? curPage,
  List<searchListData>? datas,
  num? offset,
  bool? over,
  num? pageCount,
  num? size,
  num? total,
}) => SearchData(  curPage: curPage ?? _curPage,
  datas: datas ?? _datas,
  offset: offset ?? _offset,
  over: over ?? _over,
  pageCount: pageCount ?? _pageCount,
  size: size ?? _size,
  total: total ?? _total,
);
  num? get curPage => _curPage;
  List<searchListData>? get datas => _datas;
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

/// adminAdd : false
/// apkLink : ""
/// audit : 1
/// author : "张鸿洋"
/// canEdit : false
/// chapterId : 543
/// chapterName : "Android技术周报"
/// collect : false
/// courseId : 13
/// desc : ""
/// descMd : ""
/// envelopePic : ""
/// fresh : false
/// host : ""
/// id : 29929
/// isAdminAdd : false
/// link : "https://www.wanandroid.com/blog/show/3762"
/// niceDate : "2025-04-19 00:00"
/// niceShareDate : "2025-04-19 00:10"
/// origin : ""
/// prefix : ""
/// projectLink : ""
/// publishTime : 1744992000000
/// realSuperChapterId : 542
/// selfVisible : 0
/// shareDate : 1744992600000
/// shareUser : ""
/// superChapterId : 543
/// superChapterName : "技术周报"
/// tags : []
/// title : "Android 技术周刊 （2025-04-<em class='highlight'>1</em>2 ~ 2025-04-<em class='highlight'>1</em>9）"
/// type : 0
/// userId : -1
/// visible : 1
/// zan : 0

class searchListData {
  searchListData({
      bool? adminAdd, 
      String? apkLink, 
      num? audit, 
      String? author, 
      bool? canEdit, 
      num? chapterId, 
      String? chapterName, 
      bool? collect, 
      num? courseId, 
      String? desc, 
      String? descMd, 
      String? envelopePic, 
      bool? fresh, 
      String? host, 
      num? id, 
      bool? isAdminAdd, 
      String? link, 
      String? niceDate, 
      String? niceShareDate, 
      String? origin, 
      String? prefix, 
      String? projectLink, 
      num? publishTime, 
      num? realSuperChapterId, 
      num? selfVisible, 
      num? shareDate, 
      String? shareUser, 
      num? superChapterId, 
      String? superChapterName, 
      List<dynamic>? tags, 
      String? title, 
      num? type, 
      num? userId, 
      num? visible, 
      num? zan,}){
    _adminAdd = adminAdd;
    _apkLink = apkLink;
    _audit = audit;
    _author = author;
    _canEdit = canEdit;
    _chapterId = chapterId;
    _chapterName = chapterName;
    _collect = collect;
    _courseId = courseId;
    _desc = desc;
    _descMd = descMd;
    _envelopePic = envelopePic;
    _fresh = fresh;
    _host = host;
    _id = id;
    _isAdminAdd = isAdminAdd;
    _link = link;
    _niceDate = niceDate;
    _niceShareDate = niceShareDate;
    _origin = origin;
    _prefix = prefix;
    _projectLink = projectLink;
    _publishTime = publishTime;
    _realSuperChapterId = realSuperChapterId;
    _selfVisible = selfVisible;
    _shareDate = shareDate;
    _shareUser = shareUser;
    _superChapterId = superChapterId;
    _superChapterName = superChapterName;
    _tags = tags;
    _title = title;
    _type = type;
    _userId = userId;
    _visible = visible;
    _zan = zan;
}

  searchListData.fromJson(dynamic json) {
    _adminAdd = json['adminAdd'];
    _apkLink = json['apkLink'];
    _audit = json['audit'];
    _author = json['author'];
    _canEdit = json['canEdit'];
    _chapterId = json['chapterId'];
    _chapterName = json['chapterName'];
    _collect = json['collect'];
    _courseId = json['courseId'];
    _desc = json['desc'];
    _descMd = json['descMd'];
    _envelopePic = json['envelopePic'];
    _fresh = json['fresh'];
    _host = json['host'];
    _id = json['id'];
    _isAdminAdd = json['isAdminAdd'];
    _link = json['link'];
    _niceDate = json['niceDate'];
    _niceShareDate = json['niceShareDate'];
    _origin = json['origin'];
    _prefix = json['prefix'];
    _projectLink = json['projectLink'];
    _publishTime = json['publishTime'];
    _realSuperChapterId = json['realSuperChapterId'];
    _selfVisible = json['selfVisible'];
    _shareDate = json['shareDate'];
    _shareUser = json['shareUser'];
    _superChapterId = json['superChapterId'];
    _superChapterName = json['superChapterName'];
    if (json['tags'] != null) {
      _tags = [];
      json['tags'].forEach((v) {
        _tags?.add(v);
      });
    }
    _title = json['title'];
    _type = json['type'];
    _userId = json['userId'];
    _visible = json['visible'];
    _zan = json['zan'];
  }
  bool? _adminAdd;
  String? _apkLink;
  num? _audit;
  String? _author;
  bool? _canEdit;
  num? _chapterId;
  String? _chapterName;
  bool? _collect;
  num? _courseId;
  String? _desc;
  String? _descMd;
  String? _envelopePic;
  bool? _fresh;
  String? _host;
  num? _id;
  bool? _isAdminAdd;
  String? _link;
  String? _niceDate;
  String? _niceShareDate;
  String? _origin;
  String? _prefix;
  String? _projectLink;
  num? _publishTime;
  num? _realSuperChapterId;
  num? _selfVisible;
  num? _shareDate;
  String? _shareUser;
  num? _superChapterId;
  String? _superChapterName;
  List<dynamic>? _tags;
  String? _title;
  num? _type;
  num? _userId;
  num? _visible;
  num? _zan;
searchListData copyWith({  bool? adminAdd,
  String? apkLink,
  num? audit,
  String? author,
  bool? canEdit,
  num? chapterId,
  String? chapterName,
  bool? collect,
  num? courseId,
  String? desc,
  String? descMd,
  String? envelopePic,
  bool? fresh,
  String? host,
  num? id,
  bool? isAdminAdd,
  String? link,
  String? niceDate,
  String? niceShareDate,
  String? origin,
  String? prefix,
  String? projectLink,
  num? publishTime,
  num? realSuperChapterId,
  num? selfVisible,
  num? shareDate,
  String? shareUser,
  num? superChapterId,
  String? superChapterName,
  List<dynamic>? tags,
  String? title,
  num? type,
  num? userId,
  num? visible,
  num? zan,
}) => searchListData(  adminAdd: adminAdd ?? _adminAdd,
  apkLink: apkLink ?? _apkLink,
  audit: audit ?? _audit,
  author: author ?? _author,
  canEdit: canEdit ?? _canEdit,
  chapterId: chapterId ?? _chapterId,
  chapterName: chapterName ?? _chapterName,
  collect: collect ?? _collect,
  courseId: courseId ?? _courseId,
  desc: desc ?? _desc,
  descMd: descMd ?? _descMd,
  envelopePic: envelopePic ?? _envelopePic,
  fresh: fresh ?? _fresh,
  host: host ?? _host,
  id: id ?? _id,
  isAdminAdd: isAdminAdd ?? _isAdminAdd,
  link: link ?? _link,
  niceDate: niceDate ?? _niceDate,
  niceShareDate: niceShareDate ?? _niceShareDate,
  origin: origin ?? _origin,
  prefix: prefix ?? _prefix,
  projectLink: projectLink ?? _projectLink,
  publishTime: publishTime ?? _publishTime,
  realSuperChapterId: realSuperChapterId ?? _realSuperChapterId,
  selfVisible: selfVisible ?? _selfVisible,
  shareDate: shareDate ?? _shareDate,
  shareUser: shareUser ?? _shareUser,
  superChapterId: superChapterId ?? _superChapterId,
  superChapterName: superChapterName ?? _superChapterName,
  tags: tags ?? _tags,
  title: title ?? _title,
  type: type ?? _type,
  userId: userId ?? _userId,
  visible: visible ?? _visible,
  zan: zan ?? _zan,
);
  bool? get adminAdd => _adminAdd;
  String? get apkLink => _apkLink;
  num? get audit => _audit;
  String? get author => _author;
  bool? get canEdit => _canEdit;
  num? get chapterId => _chapterId;
  String? get chapterName => _chapterName;
  bool? get collect => _collect;
  num? get courseId => _courseId;
  String? get desc => _desc;
  String? get descMd => _descMd;
  String? get envelopePic => _envelopePic;
  bool? get fresh => _fresh;
  String? get host => _host;
  num? get id => _id;
  bool? get isAdminAdd => _isAdminAdd;
  String? get link => _link;
  String? get niceDate => _niceDate;
  String? get niceShareDate => _niceShareDate;
  String? get origin => _origin;
  String? get prefix => _prefix;
  String? get projectLink => _projectLink;
  num? get publishTime => _publishTime;
  num? get realSuperChapterId => _realSuperChapterId;
  num? get selfVisible => _selfVisible;
  num? get shareDate => _shareDate;
  String? get shareUser => _shareUser;
  num? get superChapterId => _superChapterId;
  String? get superChapterName => _superChapterName;
  List<dynamic>? get tags => _tags;
  String? get title => _title;
  num? get type => _type;
  num? get userId => _userId;
  num? get visible => _visible;
  num? get zan => _zan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adminAdd'] = _adminAdd;
    map['apkLink'] = _apkLink;
    map['audit'] = _audit;
    map['author'] = _author;
    map['canEdit'] = _canEdit;
    map['chapterId'] = _chapterId;
    map['chapterName'] = _chapterName;
    map['collect'] = _collect;
    map['courseId'] = _courseId;
    map['desc'] = _desc;
    map['descMd'] = _descMd;
    map['envelopePic'] = _envelopePic;
    map['fresh'] = _fresh;
    map['host'] = _host;
    map['id'] = _id;
    map['isAdminAdd'] = _isAdminAdd;
    map['link'] = _link;
    map['niceDate'] = _niceDate;
    map['niceShareDate'] = _niceShareDate;
    map['origin'] = _origin;
    map['prefix'] = _prefix;
    map['projectLink'] = _projectLink;
    map['publishTime'] = _publishTime;
    map['realSuperChapterId'] = _realSuperChapterId;
    map['selfVisible'] = _selfVisible;
    map['shareDate'] = _shareDate;
    map['shareUser'] = _shareUser;
    map['superChapterId'] = _superChapterId;
    map['superChapterName'] = _superChapterName;
    if (_tags != null) {
      map['tags'] = _tags?.map((v) => v.toJson()).toList();
    }
    map['title'] = _title;
    map['type'] = _type;
    map['userId'] = _userId;
    map['visible'] = _visible;
    map['zan'] = _zan;
    return map;
  }

}