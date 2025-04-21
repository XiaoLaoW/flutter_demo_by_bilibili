import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../repository/datas/knowledge_detail_list_data.dart';
import 'knowledge_detail_vm.dart';

class KnowledgeTabChildPage extends StatefulWidget {
  const KnowledgeTabChildPage({Key? key, this.cid}) : super(key: key);
  final String? cid;

  @override
  _KnowledgeTabChildPageState createState() => _KnowledgeTabChildPageState();
}

class _KnowledgeTabChildPageState extends State<KnowledgeTabChildPage> {
  KnowledgeDetailVM knowledgeDetailVM = KnowledgeDetailVM();
  RefreshController refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    refreshOrLoad(false);
  }

  void refreshOrLoad(bool loadMore) {
    knowledgeDetailVM.fetchData(widget.cid, loadMore).then((value) {
      if (loadMore) {
        refreshController.refreshCompleted();
      } else {
        refreshController.loadComplete();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => knowledgeDetailVM,
      child: Consumer<KnowledgeDetailVM>(
        builder: (context, vm, child) {
          if (vm.knowledgeDetailListData == null || (vm.knowledgeDetailListData?.length ?? 0) < 1) {
            return Center(
              child: Text('没有数据'),
            );
          } else {
            return SmartRefresher(
              controller: refreshController,
              enablePullUp: true,
              onRefresh: () {
                refreshOrLoad(true);
              },
              onLoading: () {
                refreshOrLoad(false);
              },
              child: ListView.builder(
                itemCount: vm.knowledgeDetailListData?.length,
                itemBuilder: (context, index) {
                  return _item(vm.knowledgeDetailListData![index]);
                },
              ),
            );
          }
        },
      ),
    );
  }

  Widget _item(detailListDatas item) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.fromBorderSide(
            BorderSide(color: Colors.grey[300]!, width: 1)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item.chapterName ?? ''),
              Text(item.niceDate ?? ''),
            ],
          ),
          Text(item.title ?? ''),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('title'),
              Text(item.author ?? ''),
            ],
          ),
        ],
      ),
    );
  }
}
