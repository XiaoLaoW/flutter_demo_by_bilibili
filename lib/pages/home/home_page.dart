import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../repository/datas/home_list_data.dart';
import '../../route/route_utils.dart';
import '../../route/routes.dart';
import 'home_vm.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeViewModel viewModel = HomeViewModel();
  RefreshController controller = RefreshController();

  @override
  void initState() {
    super.initState();
    viewModel.initListData();
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
          child: SmartRefresher(
            controller: controller,
            enablePullDown: true,
            enablePullUp: true,
            header: ClassicHeader(),
            footer: ClassicFooter(),
            onLoading: () async {
              await viewModel.getHomeList().then((value){
                controller.loadComplete();
              });
            },
            onRefresh: () async {
              await viewModel.initListData().then((value){
                controller.refreshCompleted();
              });
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _banner(),
                  _homeListView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _banner() {
    return Consumer<HomeViewModel>(
      builder: (context, vm, child) {
        return SizedBox(
          width: double.infinity,
          height: 150,
          child: Swiper(
            itemCount: vm.bannerList?.length ?? 0,
            itemBuilder: (context, index) {
              return Container(
                height: 150,
                color: Colors.lightBlue,
                child: Image.network(vm.bannerList?[index]?.imagePath ?? '',
                    fit: BoxFit.fill),
              );
            },
            indicatorLayout: PageIndicatorLayout.COLOR,
            autoplay: true,
            pagination: const SwiperPagination(),
            control: const SwiperControl(),
          ),
        );
      },
    );
  }

  Widget _homeListView() {
    return Consumer<HomeViewModel>(builder: (context, vm, child) {
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _listView(vm.listData?[index],index);
        },
        itemCount: vm.listData?.length ?? 0,
      );
    });
  }

  Widget _listView(HomeListItemData? item,int index) {
    var name = item?.author ?? '';
    if (name.isEmpty) {
      name = item?.shareUser ?? '';
    }
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
                  name,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Expanded(
                child: SizedBox(),
              ),
              Text(item?.niceShareDate ?? '',
                  style: TextStyle(color: Colors.black)),
              SizedBox(
                width: 5,
              ),
              Text(
                item?.type == 0 ? '' : '置顶',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          _listItemView(item?.title ?? ''),
          Row(
            children: [
              Text(
                item?.superChapterName ?? '',
                style: TextStyle(color: Colors.green, fontSize: 12),
              ),
              Expanded(
                child: SizedBox(),
              ),
              GestureDetector(
                onTap: () {
                  viewModel.handleCollect(item?.id as int,index,item?.collect);
                },
                child:Image.asset( item?.collect == true ? 'assets/images/collect_select.png' :
                  'assets/images/collect.png',
                  width: 30,
                  height: 30,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _listItemView(String title) {
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
        child: Text(title, style: TextStyle(color: Colors.black, fontSize: 15)),
      ),
    );
  }
}
