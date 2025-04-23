import 'package:demo_by_bilibili/pages/personal/personal_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../route/route_utils.dart';
import '../../route/routes.dart';
import '../auth/login_page.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  PersonalVM personalVM = PersonalVM();
  List<Map<String, String>> list = [
    {
      "title": "我的收藏",
      "path": "/my_collection",
    },
    {
      "title": "检查更新",
      "id": "1",
    },
    {
      "title": "关于我们",
      "path": "/about_us_page",
    }
  ];

  @override
  void initState() {
    super.initState();
    personalVM.initData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => personalVM,
      child: Consumer<PersonalVM>(builder: (context, vm, child) {
        List<Map<String, String>> currentList = List.from(list);
        if (vm.shouldLogin == false) {
          currentList.add({"title": "退出登录", "id": "2"});
        }
        return Scaffold(
          body: Column(
            children: [
              _personalPageHeader(vm, () {
                if (vm.shouldLogin == false) return;
                RouteUtils.push(context, LoginPage());
              }),
              Expanded(
                child: _personalPageList(currentList),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _personalPageHeader(PersonalVM vm, void Function() onTap) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: const BoxDecoration(
        color: Colors.teal,
      ),
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: onTap,
        child: Consumer<PersonalVM>(
          builder: (context, vm, child) {
            return SafeArea(
              child: Column(
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
                  Text(
                    vm.username ?? '',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _personalPageList(List<Map<String, String>> currentList) {
    return Consumer<PersonalVM>(
      builder: (context, vm, child) {
        return ListView.builder(
          itemCount: currentList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: GestureDetector(
                onTap: () {
                  _handleItemTap(currentList[index]);
                },
                child: _personalPageListItem(currentList[index]),
              ),
            );
          },
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

  void _handleItemTap(Map<String,String> item) {
    print(item["id"]?.isNotEmpty);
    if (item["id"]?.isNotEmpty == true) {
      switch (item["id"]) {
        case "1":
          // 检查更新
          break;
        case "2":
          // 退出登录
          personalVM.logout();
          break;
        default:
          break;
      }
    } else {
      RouteUtils.pushForNamed(context,'${item['path']}');
    }
  }
}
