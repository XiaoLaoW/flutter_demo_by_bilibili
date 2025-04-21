import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../repository/datas/common_website_data.dart';
import '../../repository/datas/search_hot_key_data.dart';
import '../../route/route_utils.dart';
import '../../route/routes.dart';
import '../search/search_page.dart';
import 'hot_key_vm.dart';

typedef ItemTapCallback = void Function(String? link, [String? name]);

class HotKeyPage extends StatefulWidget {
  @override
  _HotKeyPageState createState() => _HotKeyPageState();
}

class _HotKeyPageState extends State<HotKeyPage> {
  HotKeyViewModel viewModel = HotKeyViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getHotKey().then((value) {
      viewModel.getSearchHotKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HotKeyViewModel>(
      create: (context) => viewModel,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 0.5, color: Colors.grey),
                      bottom: BorderSide(width: 0.5, color: Colors.grey),
                    ),
                  ),
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 6, bottom: 6),
                  child: Row(
                    children: [
                      Text('搜索热词'),
                      Expanded(
                        child: SizedBox(),
                      ),
                      GestureDetector(
                        onTap: () {
                          RouteUtils.push(context, SearchPage());
                        },
                        child: Image.asset(
                          'assets/images/search.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Consumer<HotKeyViewModel>(
                  builder: (context, model, child) {
                    return _gridView(false,
                        SearchHotKeyList: model.SearchHotKeyList,
                        itemTap: (link, [name]) {
                      RouteUtils.push(context, SearchPage(keyword: name ?? ''));
                        });
                  },
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  child: Text('常用网站'),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 0.5, color: Colors.grey),
                      bottom: BorderSide(width: 0.5, color: Colors.grey),
                    ),
                  ),
                ),
                Consumer<HotKeyViewModel>(
                  builder: (context, model, child) {
                    return _gridView(true, websiteList: model.websiteList,
                        itemTap: (link, [name]) {
                      RouteUtils.pushForNamed(context, RoutePath.webViewPage,
                          arguments: {'url': link, 'title': name});
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _gridView(
    bool? isWebsite, {
    List<CommonWebsiteData>? websiteList,
    List<SearchHotKeyData>? SearchHotKeyList,
    required ItemTapCallback itemTap,
  }) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 120,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 2,
      ),
      itemBuilder: (context, index) {
        if (isWebsite == true) {
          var list = websiteList;
          return _item(list?[index].name,
              itemTap: itemTap, link: list?[index].link);
        } else {
          var list = SearchHotKeyList;
          return _item(list?[index].name, itemTap: itemTap);
        }
      },
      itemCount: isWebsite == true
          ? websiteList?.length ?? 0
          : SearchHotKeyList?.length ?? 0,
    );
  }

  Widget _item(String? name, {required ItemTapCallback itemTap, String? link}) {
    return GestureDetector(
      onTap: () {
        if (link != null) {
          itemTap.call(link ?? '', name ?? '');
        } else {
          itemTap.call(name ?? '');
        }
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Text(name ?? ''),
      ),
    );
  }
}
