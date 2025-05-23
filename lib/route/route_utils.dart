import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteUtils {
  RouteUtils._();

  static final navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;

  static NavigatorState get navigator => navigatorKey.currentState!;

  static Future push(
    BuildContext context,
    Widget page, {
    bool? fullscreenDialog,
    RouteSettings? settings,
    bool maintainState = true,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => page,
          fullscreenDialog: fullscreenDialog ?? false,
          settings: settings,
          maintainState: maintainState),
    );
  }

  static Future pushForNamed(
    BuildContext context,
    String name, {
    Object? arguments,
  }) {
    return Navigator.pushNamed(context, name, arguments: arguments);
  }

  static Future pushForPageRoute(BuildContext context, Route route) {
    return Navigator.push(context, route);
  }

  static Future pushNamedAndRemoveUntil(
    BuildContext context,
    String name, {
    Object? arguments,
  }) {
    return Navigator.pushNamedAndRemoveUntil(context, name, (route) => false,
        arguments: arguments);
  }

  static  pop (
      BuildContext context,
      ){
    return Navigator.pop(context);
  }
}
