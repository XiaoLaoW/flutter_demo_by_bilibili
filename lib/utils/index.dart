import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastHelper {
  static ToastHelper? _instance;

  ToastHelper._();

  static ToastHelper get instance {
    return _instance ??= ToastHelper._();
  }

  void showToast(String? msg) {
    Fluttertoast.showToast(
      msg: msg ?? '',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }
}

class DialogHelper {
  static DialogHelper? _instance;

  DialogHelper._();

  static DialogHelper get instance {
    return _instance ??= DialogHelper._();
  }

  void showBasicDialog(BuildContext context,String? title,void Function()? onConfirm) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('提示'),
          content: Text(title ?? ''),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('取消'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('确定'),
            ),
          ],
        );
      },
    ).then((value) {
      if (value == true) {
        onConfirm?.call();
      }
    });
  }
}