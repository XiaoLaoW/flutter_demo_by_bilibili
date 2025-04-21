import 'package:demo_by_bilibili/pages/personal/personal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common_ui/navigation/navigation_bar.dart';
import 'home/home_page.dart';
import 'hot_key/hot_key.dart';
import 'knowledge/knowledge.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {

  late List<Widget> pages;

  late List<String> labels;

  late List<Widget> icons;

  late List<Widget> activeIcons;

  void initTabData() {
    pages = [
      HomePage(),
      HotKeyPage(),
      KnowledgePage(),
      PersonalPage(),
    ];
    labels = ['Home', 'HotKey', 'Knowledge', 'Personal'];
    icons = [
      Image.asset('assets/icons/home_grey.png', width: 32.0, height: 32.0),
      Image.asset('assets/icons/hot_key_grey.png', width: 32.0, height: 32.0),
      Image.asset('assets/icons/knowledge_grey.png', width: 32.0, height: 32.0),
      Image.asset('assets/icons/personal_grey.png',width: 32.0, height: 32.0),
    ];
    activeIcons = [
      Image.asset('assets/icons/home.png', width: 32.0, height: 32.0),
      Image.asset('assets/icons/hot_key.png', width: 32.0, height: 32.0),
      Image.asset('assets/icons/knowledge.png', width: 32.0, height: 32.0),
      Image.asset('assets/icons/personal.png', width: 32.0, height: 32.0),
    ];
  }

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    initTabData();
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBarWidget(pages: pages, labels: labels, icons: icons, activeIcons: activeIcons, currentIndex: currentIndex, onTabChange: (index) {
      setState(() {
        currentIndex = index;
        });
    });
  }
}
