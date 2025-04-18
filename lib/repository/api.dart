import 'package:dio/dio.dart';

import '../http/dio_instance.dart';
import 'datas/common_website_data.dart';
import 'datas/home_banner_data.dart';
import 'datas/home_list_data.dart';
import 'datas/search_hot_key_data.dart';


class Api {
  static Api instance = Api._();

  Api._();

  Future<List<HomeBannerData>?> getBanner()async{
    Response response = await DioInstance.instance.get(path:'banner/json');
    HomeBannerListData bannerData = HomeBannerListData.fromJson(response.data);
    return bannerData.bannerList;
  }

  Future<List<HomeListItemData>?> getHomeList(int page)async{
    Response response = await DioInstance.instance.get(path:'article/list/$page/json');
    HomeListData homeData = HomeListData.fromJson(response.data);
    return homeData.datas;
  }

  Future<List<HomeListItemData>?> getHomeTopList()async{
    Response response = await DioInstance.instance.get(path:'article/top/json');
    HomeTopListData homeData = HomeTopListData.fromJson(response.data);
    return homeData.topList;
  }

  Future<List<CommonWebsiteData>?> getCommonWebsiteList()async{
    Response response = await DioInstance.instance.get(path:'friend/json');
    CommonWebsiteListData commonWebsiteData = CommonWebsiteListData.fromJson(response.data);
    return commonWebsiteData.websiteList;
  }

  Future<List<SearchHotKeyData>?> getSearchHotKeyList()async{
    Response response = await DioInstance.instance.get(path:'hotkey/json');
    SearchHotKeyListData SearchHotKeyData = SearchHotKeyListData.fromJson(response.data);
    return SearchHotKeyData.SearchHotKeyList;
  }

  Future register(String? name,String? password,String? repassword)async{
    Response response = await DioInstance.instance.post(path:'user/register',param: {'username':name,'password':password,'repassword':repassword});
    return true;
  }
}

