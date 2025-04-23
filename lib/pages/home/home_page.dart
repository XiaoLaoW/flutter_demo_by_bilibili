import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common_ui/collection_item.dart';
import '../../common_ui/loading.dart';
import '../../common_ui/web/webview_page.dart';
import '../../common_ui/web/webview_widget.dart';
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
              await viewModel.getHomeList().then((value) {
                controller.loadComplete();
              });
            },
            onRefresh: () async {
              await viewModel.initListData().then((value) {
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
              return GestureDetector(
                onTap: () {
                  RouteUtils.push(
                    context,
                    WebViewPage(
                        loadResource: vm.bannerList?[index]?.url ?? '',
                        webViewType: WebViewWidgetType.URL,
                        title: vm.bannerList?[index]?.title,
                        showTitle: true),
                  );
                },
                child: Container(
                  height: 150,
                  color: Colors.lightBlue,
                  child: Image.network(vm.bannerList?[index]?.imagePath ?? '',
                      fit: BoxFit.fill),
                ),
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
          return _listView(vm.listData?[index], index);
        },
        itemCount: vm.listData?.length ?? 0,
      );
    });
  }

  Widget _listView(HomeListItemData? item, int index) {
    var name = item?.author ?? '';
    if (name.isEmpty) {
      name = item?.shareUser ?? '';
    }
    return GestureDetector(
      onTap: () {
        RouteUtils.push(
          context,
          WebViewPage(
            loadResource: item?.link ?? '',
            webViewType: WebViewWidgetType.URL,
            title: item?.title,
            showTitle: true,
          ),
        );
      },
      child: CollectionItem(
        leftTop: name,
        date: item?.niceShareDate ?? '',
        avatar: 'https://t7.baidu.com/it/u=2621658848,3952322712&fm=193&f=GIF',
        content: item?.title ?? '',
        rightBottom: GestureDetector(
          onTap: () {
            viewModel.handleCollect(
                item?.id as int, index, item?.collect);
          },
          child: Image.asset(
            item?.collect == true
                ? 'assets/images/collect_select.png'
                : 'assets/images/collect.png',
            width: 30,
            height: 30,
          ),
        ),
        leftBottom: item?.superChapterName ?? '',
      ),
    );
  }
}
