import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../repository/datas/knowledge_data.dart';
import '../../route/route_utils.dart';
import 'detail/knowledge_detail_tab_page.dart';
import 'knowledge_vm.dart';

class KnowledgePage extends StatefulWidget {
  @override
  _KnowledgePageState createState() => _KnowledgePageState();
}

class _KnowledgePageState extends State<KnowledgePage> {
  KnowledgeViewModel viewModel = KnowledgeViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.fetchKnowledgeData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Scaffold(
        body: SafeArea(
          child: Consumer<KnowledgeViewModel>(
            builder: (context, vm, child) {
              return ListView.builder(
                itemCount: vm.knowledgeDataList?.length ,
                itemBuilder: (context, index) {
                  return _itemView(vm.knowledgeDataList?[index],vm);
                },
              );
            }
          ),
        ),
      ),
    );
  }

  Widget _itemView(KnowledgeData? item,KnowledgeViewModel vm) {
    return GestureDetector(
      onTap: () {
        RouteUtils.push(context,KnowledgeDetailTabPage(tabList: item?.children));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          title: Text(item?.name ?? '',
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(vm.generateSubTitle(item?.children),),
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      ),
    );
  }
}
