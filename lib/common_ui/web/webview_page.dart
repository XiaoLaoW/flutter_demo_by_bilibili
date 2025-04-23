import 'package:demo_by_bilibili/common_ui/web/webview_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class WebViewPage extends StatefulWidget {
  WebViewPage({
    super.key,
    required this.loadResource,
    required this.webViewType,
    this.showTitle,
    this.title,
    this.jsChannelMap,
  });

  final bool? showTitle;

  final String? title;

  final String loadResource;

  final WebViewWidgetType webViewType;

  final Map<String, JsChannelCallback>? jsChannelMap;

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage>  {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (widget.showTitle ?? false) ? AppBar(title:_buildAppBar(widget.showTitle, widget.title?? '')) : null,
      body:Container(
        child:WebViewWidget(
          webViewType: widget.webViewType,
          loadResource: widget.loadResource,
          jsChannelMap: widget.jsChannelMap,
        ),
      ),
    );
  }

  Widget _buildAppBar(bool? showTitle, String? title) {
    var show = showTitle ?? false;
    return show ? Html(data: title?? '',style: {'html': Style(fontSize: FontSize(18))}) : const SizedBox.shrink();
  }

  String limitsStr(String? content,{int limit = 15}) {
    if (content == null || content.isEmpty == true) {
      return '';
    }
    if (content.length > limit) {
      return content.substring(0, limit);
    } else {
      return content;
    }
  }
}
