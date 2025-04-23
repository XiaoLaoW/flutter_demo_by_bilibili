import 'package:demo_by_bilibili/pages/search/search_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common_ui/web/webview_page.dart';
import '../../common_ui/web/webview_widget.dart';
import '../../route/route_utils.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key, this.keyword}) : super(key: key);
  String? keyword = "";

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _searchController;
  late RefreshController _refreshController;
  SearchVM searchViewModel = SearchVM();

  @override
  void initState() {
    super.initState();
    print("SearchPage initState---${widget.keyword}");
    _searchController = TextEditingController(text: widget.keyword);
    _refreshController = RefreshController();
    if (widget.keyword?.isNotEmpty == true) {
      searchViewModel.search(widget.keyword);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => searchViewModel,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              _searchBar(
                  () {
                    RouteUtils.pop(context);
                  },
                  () {},
                  (value) {
                    searchViewModel.search(_searchController.text);
                  }),
              Expanded(
                child: _searchResult(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBar(GestureTapCallback onBack, GestureTapCallback onCancel,
      ValueChanged<String> onSubmitted) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.teal,
      child: Row(
        children: [
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              onBack();
            },
            child: Icon(Icons.arrow_left, color: Colors.white, size: 30),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              child: TextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                onSubmitted: (value) {
                  onSubmitted(value);
                },
                controller: _searchController,
                style: TextStyle(color: Colors.black, fontSize: 16),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: const EdgeInsets.only(left: 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "搜索",
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              onCancel();
            },
            child: Text(
              '取消',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget _searchResult() {
    return Consumer<SearchVM>(
      builder: (context, vm, child) {
        return SmartRefresher(
          controller: _refreshController,
          enablePullDown: false,
          enablePullUp: true,
          child: ListView.builder(
            itemCount: vm.searchData?.length ?? 0,
            itemBuilder: (context, index) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey)),
                ),
                child: _listItem(vm.searchData?[index].title ?? "",
                    vm.searchData?[index].link ?? ""),
              );
            },
          ),
        );
      },
    );
  }

  Widget _listItem(String title, String link) {
    return GestureDetector(
      onTap: () {
        //跳转webViewPage
        RouteUtils.push(
          context,
          WebViewPage(
              loadResource: link ?? "",
              webViewType: WebViewWidgetType.URL,
              title: title ?? "",
              showTitle: true),
        );
      },
      child: Html(
        data: title,
        style: {
          "html": Style(fontSize: FontSize(16)),
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _refreshController.dispose();
    super.dispose();
  }
}
