import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationBarWidget extends StatefulWidget {
   NavigationBarWidget(
      {super.key, required this.pages, required this.labels, required this.icons, required this.activeIcons,this.currentIndex, required this.onTabChange}) {
    if (pages.length != labels.length || pages.length != icons.length ||
        pages.length != activeIcons.length || pages.length != icons.length) {
      throw Exception(
          'The length of pages, labels, icons, and activeIcons must be the same.');
    }
  }

  final List<Widget> pages;

  final List<String> labels;

  final List<Widget> icons;

  final List<Widget> activeIcons;

  final ValueChanged<int> onTabChange;

  int? currentIndex;

  @override
  _NavigationBarWidgetState createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {

  List<BottomNavigationBarItem> _barItemList() {
    List<BottomNavigationBarItem> items = [];
    for (int i = 0; i < widget.labels.length; i++) {
      items.add(BottomNavigationBarItem(
          icon: widget.icons[i],
          activeIcon: widget.activeIcons[i],
          label: widget.labels[i]));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: widget.currentIndex ?? 0,
          children: widget.pages,
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(fontSize: 14.0, color: Colors.black),
            unselectedLabelStyle: TextStyle(
                fontSize: 12.0, color: Colors.blueGrey),
            currentIndex: widget.currentIndex ?? 0,
            items: _barItemList(),
            onTap: (index) {
              widget.onTabChange.call(index);
            }),
      ),
    );
  }

}