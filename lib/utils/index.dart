import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastHelper {
  final String msg;

  ToastHelper(this.msg);

  void showToast() {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }
}