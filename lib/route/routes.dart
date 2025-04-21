import 'package:demo_by_bilibili/pages/auth/login_page.dart';
import 'package:demo_by_bilibili/pages/web_view_page.dart';
import 'package:flutter/material.dart';

import '../pages/auth/register_page.dart';
import '../pages/knowledge/detail/knowledge_detail_tab_page.dart';
import '../pages/tab_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.tab:
        return pageRoute(TabPage(), settings: settings);
      case RoutePath.webViewPage:
        return pageRoute(WebViewPage(), settings: settings);
      case RoutePath.loginPage:
        return pageRoute(LoginPage(), settings: settings);
      case RoutePath.registerPage:
        return pageRoute(RegisterPage(), settings: settings);
      case RoutePath.knowledgeDetailPage:
        return pageRoute(KnowledgeDetailTabPage(), settings: settings);
      case RoutePath.searchPage:
        return pageRoute(KnowledgeDetailTabPage(), settings: settings);
    }
    return pageRoute(
      Scaffold(
        body: SafeArea(
          child: Center(
            child: Text('route path ${settings.name} not exist'),
          ),
        ),
      ),
    );
  }

  static MaterialPageRoute pageRoute(
    Widget page, {
    RouteSettings? settings,
    bool? fullscreenDialog,
    bool? maintainState,
    bool? allowSnapshotting,
  }) {
    return MaterialPageRoute(
      builder: (context) {
        return page;
      },
      settings: settings,
      fullscreenDialog: fullscreenDialog ?? false,
      maintainState: maintainState ?? true,
      allowSnapshotting: allowSnapshotting ?? true,
    );
  }
}

class RoutePath {
  //首页
  static const String tab = '/';
  static const String webViewPage = '/web_view_page';
  static const String loginPage = '/login_page';
  static const String registerPage = '/register_page';
  static const String knowledgeDetailPage = '/knowledge_detail_page';
  static const String searchPage = '/search_page';
}
