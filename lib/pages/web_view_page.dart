import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WebViewPageState();
  }
}

class _WebViewPageState extends State<WebViewPage> {
  String? title;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var map = ModalRoute.of(context)?.settings.arguments;
      if (map is Map) {
        title = map['name'];
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ''),
      ),
      body: SafeArea(
        child: Container(
          child: ElevatedButton(
              child: Text('back'),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
      ),
    );
  }
}
