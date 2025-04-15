import 'package:demo_by_bilibili/datas/home_banner_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel with ChangeNotifier{
  List<BannerItemData>? bannerList;
  Dio dio = Dio();
  void initDio (){
    dio.options = BaseOptions(
      method: 'GET',
      baseUrl: 'https://www.wanandroid.com/',
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
      sendTimeout: Duration(seconds: 30),
    );
  }
   Future<List<BannerItemData>?> getBanner() async {
    Response response = await dio.get('banner/json');
    HomeBannerData bannerData = HomeBannerData.fromJson(response.data);
    if (bannerData.data != null) {
      bannerList = bannerData.data;
    } else {
      bannerList = [];
    }
    notifyListeners();
  }

  Future getHomeList() async {

  }
}
