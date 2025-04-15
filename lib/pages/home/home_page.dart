import 'package:demo_by_bilibili/pages/web_view_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:provider/provider.dart';

import '../../datas/home_banner_data.dart';
import '../../route/route_utils.dart';
import '../../route/routes.dart';
import 'home_vm.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var images = ['1', '2', '3'];
  HomeViewModel viewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.initDio();
    viewModel.getBanner();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) {
        return viewModel;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('data'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _banner(),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return _listView();
                  },
                  itemCount: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _banner() {
    return Consumer<HomeViewModel>(builder: (context,vm,child){
      return SizedBox(
        width: double.infinity,
        height: 150,
        child: Swiper(
          itemCount: vm.bannerList?.length ?? 0,
          itemBuilder: (context, index) {
            return Container(
              height: 150,
              color: Colors.lightBlue,
              child: Image.network(vm.bannerList?[index].imagePath ?? ''),
            );
          },
          indicatorLayout: PageIndicatorLayout.COLOR,
          autoplay: true,
          pagination: const SwiperPagination(),
          control: const SwiperControl(),
        ),
      );
    },);
  }

  Widget _listView() {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
          width: 0.5,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  'https://t7.baidu.com/it/u=2621658848,3952322712&fm=193&f=GIF',
                  width: 30,
                  height: 30,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  'author',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Expanded(
                child: SizedBox(),
              ),
              Text('2025-02-25', style: TextStyle(color: Colors.black)),
              SizedBox(
                width: 5,
              ),
              Text(
                '置顶',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          _listItemView(),
          Row(
            children: [
              Text(
                '分类',
                style: TextStyle(color: Colors.green, fontSize: 12),
              ),
              Expanded(
                child: SizedBox(),
              ),
              Image.asset(
                'assets/images/hot.png',
                width: 30,
                height: 30,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _listItemView() {
    return GestureDetector(
      onTap: () {
        RouteUtils.pushForNamed(context, RoutePath.webViewPage,
            arguments: {"name": "使用路由传值"});
        // Navigator.pushNamed(context, RoutePath.webViewPage);
        // Navigator.push(context,MaterialPageRoute(builder: (context){
        //   return WebViewPage(title:'首页跳转');
        // }),);
      },
      child: Container(
        child: Text('标题' * 15,
            style: TextStyle(color: Colors.black, fontSize: 15)),
      ),
    );
  }
}
