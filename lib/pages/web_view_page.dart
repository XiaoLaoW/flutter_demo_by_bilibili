import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WebViewPageState();
  }
}

class _WebViewPageState extends State<WebViewPage> {
  late  String? title = '';
  late  String? url = '';
  late  WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   var map = ModalRoute.of(context)?.settings.arguments;
    //   if (map is Map) {
    //     print(map['arguments']);
    //     title = map['name'] as String;
    //     url = (map['arguments'] as Map?)?['url'] as String;
    //     setState(() {});
    //   }
    // });

    // 初始化 WebViewController
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // 启用 JavaScript
      ..setBackgroundColor(const Color(0x00000000));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var map = ModalRoute.of(context)?.settings.arguments;
    print('didChangeDependencies${ ModalRoute.of(context)?.settings.arguments}----${map is Map}');

    if (map is Map) {
      url = map['url'] as String?;

      // 确保 URL 是有效的 URI
      if (url != null && url!.isNotEmpty) {
        _controller.loadRequest(Uri.parse(url!));
      } else {
        print('Invalid URL: $url');
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ''),
      ),
      body: SafeArea(
        child:WebViewWidget(
          controller: _controller,
        ),
      ),
    );
  }
}
