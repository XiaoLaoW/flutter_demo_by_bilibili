import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

// import '../../http/dio_instance.dart';
import '../../repository/api.dart';
import '../../repository/datas/home_banner_data.dart';
import '../../repository/datas/home_list_data.dart';

class HomeViewModel with ChangeNotifier {
  List<HomeBannerData>? bannerList;
  List<HomeListItemData>? listData = [];
  int page = 0;

  Future getBanner() async {
    // Response response = await DioInstance.instance.get(path:'banner/json');
    // HomeBannerListData bannerData = HomeBannerListData.fromJson(response);
    // if (bannerData.bannerList!= null){
    //   bannerList = bannerData.bannerList;
    // } else {
    //   bannerList = [];
    // }
    List<HomeBannerData>? list = await Api.instance.getBanner();
    bannerList = list ?? [];
    notifyListeners();
  }

  Future initListData() async {
    page = 0;
    await getBanner();
    await getHomeTopList();
    await getHomeList();
  }

  Future getHomeList() async {
    // Response response = await DioInstance.instance.get(path:'article/list/$page/json');
    // HomeListData homeData = HomeListData.fromJson(response);
    // if (homeData.datas?.isNotEmpty == true){
    //   listData = homeData.datas;
    // } else {
    //   listData = [];
    // }
    List<HomeListItemData>? list = await Api.instance.getHomeList(page);
    listData?.addAll(list ?? []);
    page++;
    notifyListeners();
  }

  Future getHomeTopList() async {
    List<HomeListItemData>? list = await Api.instance.getHomeTopList();
    listData?.clear();
    listData?.addAll(list ?? []);
    notifyListeners();
  }
  Future handleCollect(int id,int index,bool? isCollect) async{
    bool? result = false;
    if (isCollect == true) {
       result = await Api.instance.unCollect(id);
    } else {
       result = await Api.instance.collect(id);
    }
    print('result------------$result');
    if (result == true) {
      listData?[index].collect = !isCollect!;
      notifyListeners();
    }
  }
}
