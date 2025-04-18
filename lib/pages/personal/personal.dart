import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../route/route_utils.dart';
import '../auth/login_page.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  final List<Map<String, String>> list = [
    {
      "title": "我的收藏",
      "path": "",
    },
    {
      "title": "检查更新",
      "path": "",
    },
    {
      "title": "关于我们",
      "path": "",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _personalPageHeader(() {
              RouteUtils.push(context, LoginPage());
            }),
            Expanded(
              child: _personalPageList(),
            ),
          ],
        ),
      ),
    );
  }
  Widget _personalPageHeader(void Function() onTap) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: const BoxDecoration(
        color: Colors.teal,
      ),
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: onTap,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(35),
              ),
              child: Image.asset('assets/images/avatar.png',
                  width: 70, height: 70, fit: BoxFit.fill),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "未登录",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _personalPageList() {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: GestureDetector(
            onTap: () {
              _handleItemTap(index);
            },
            child:_personalPageListItem(list[index]),
          ),
        );
      },
    );
  }

  Widget _personalPageListItem(Map<String, String> item) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item["title"] as String),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }

  void _handleItemTap(int index) {
    print(list[index]["title"]);
  }
}
