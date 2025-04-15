import 'package:dio/dio.dart';

import '../http/dio_instance.dart';
import 'datas/home_banner_data.dart';
import 'datas/home_list_data.dart';


class Api {
  static Api instance = Api._();

  Api._();

  Future<List<HomeBannerData>?> getBanner()async{
    Response response = await DioInstance.instance.get(path:'banner/json');
    HomeBannerListData bannerData = HomeBannerListData.fromJson(response.data);
    print('${response.toString()}---bannerData.bannerList');
    return bannerData.bannerList;
  }

  Future<List<HomeListItemData>?> getHomeList(int page)async{
    Response response = await DioInstance.instance.get(path:'article/list/$page/json');
    HomeListData homeData = HomeListData.fromJson(response.data);
    return homeData.datas;
  }
}