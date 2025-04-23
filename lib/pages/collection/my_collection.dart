import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common_ui/collection_item.dart';
import '../../utils/index.dart';
import 'my_collection_vm.dart';

class MyCollectionPage extends StatefulWidget {
  @override
  _MyCollectionPageState createState() => _MyCollectionPageState();
}

class _MyCollectionPageState extends State<MyCollectionPage> {
  late final RefreshController _controller;
  MyCollectionVM myCollectionVM = MyCollectionVM();

  @override
  void initState() {
    super.initState();
    _controller = RefreshController();
    myCollectionVM.fetchCollectList();
  }

  void _onRefreshOrLoadMore(bool? clear) {
    if (clear == true) {
      myCollectionVM.fetchCollectList(true);
      _controller.refreshCompleted();
    } else {
      myCollectionVM.fetchCollectList();
      _controller.loadComplete();
    }
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => myCollectionVM,
      child: Scaffold(
        appBar: AppBar(
          title: Text('我的收藏'),
        ),
        body: SafeArea(
          child: Consumer<MyCollectionVM>(builder: (context, vm, child) {
            return SmartRefresher(
              controller: _controller,
              enablePullUp: !vm.isLast,
              onRefresh: () {
                _onRefreshOrLoadMore(true);
              },
              onLoading: ()  {
                _onRefreshOrLoadMore(false);
              },
              child: ListView.builder(
                itemCount: vm.collectList?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  var item = vm.collectList?[index];
                  return CollectionItem(
                    leftTop: item?.author ?? '',
                    leftBottom: item?.chapterName ?? '',
                    date: item?.niceDate ?? '',
                    content: item?.title ?? '',
                    rightBottom: GestureDetector(
                      onTap: () {
                        DialogHelper.instance.showBasicDialog(context, '确定要取消收藏吗？',(){
                          vm.cancelCollect(item!.id as int);
                        });
                      },
                      child: Image.asset(
                        'assets/images/collect_select.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                  );
                },
              ),
            );
          }),
        ),
      ),
    );
  }
}
