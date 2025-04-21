import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../repository/datas/knowledge_data.dart';
import 'knowledge_detail_vm.dart';
import 'knowledge_tab_child_page.dart';

class KnowledgeDetailTabPage extends StatefulWidget {
  KnowledgeDetailTabPage({Key? key, this.tabList}) : super(key: key);

  final List<KnowledgeDataChildren>? tabList;

  @override
  _KnowledgeDetailTabPageState createState() => _KnowledgeDetailTabPageState();
}

class _KnowledgeDetailTabPageState extends State<KnowledgeDetailTabPage>
    with SingleTickerProviderStateMixin {
  KnowledgeDetailVM knowledgeDetailVM = KnowledgeDetailVM();
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget.tabList?.length ?? 0, vsync: this);
    knowledgeDetailVM.initTabs(widget.tabList);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => knowledgeDetailVM,
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<KnowledgeDetailVM>(builder: (context, KnowledgeDetailVM vm, child) {
            return TabBar(
              tabs: vm.tabs,
              controller: _tabController,
              labelColor: Colors.blue,
              indicatorColor: Colors.blue,
              isScrollable: true,
            );
          }),
        ),
        body: SafeArea(
          child: TabBarView(children: _children(),controller: _tabController),
        ),
      ),
    );
  }

  List<Widget> _children(){
    return widget.tabList?.map((e){
      return KnowledgeTabChildPage(cid: '${e.id}');
    }).toList()?? [];
  }
  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }
}
