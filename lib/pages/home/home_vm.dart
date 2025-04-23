import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

// import '../../http/dio_instance.dart';
import '../../common_ui/loading.dart';
import '../../repository/api.dart';
import '../../repository/datas/home_banner_data.dart';
import '../../repository/datas/home_list_data.dart';
import '../../utils/index.dart';

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
    Loading.showLoading();
    await getBanner();
    await getHomeTopList();
    await getHomeList();
    Loading.hideLoading();
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
    if (result == true) {
      listData?[index].collect = !isCollect!;
      notifyListeners();
      if(isCollect == true) {
        ToastHelper.instance.showToast('取消成功');
      } else {
        ToastHelper.instance.showToast('收藏成功');
      }
    }
  }
}
