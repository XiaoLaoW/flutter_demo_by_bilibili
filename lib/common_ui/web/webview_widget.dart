import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../loading.dart';

enum WebViewWidgetType {
  HTMLTEXT,
  URL,
}

typedef dynamic JsChannelCallback(List<dynamic> args);

class WebViewWidget extends StatefulWidget {
  const WebViewWidget({
    super.key,
    required this.webViewType,
    required this.loadResource,
    this.jsChannelMap,
    this.onWebViewCreated,
    this.clearCache,
  });

  final WebViewWidgetType webViewType;

  final String loadResource;

  final bool? clearCache;

  final Map<String, JsChannelCallback>? jsChannelMap;

  final Function(InAppWebViewController controller)? onWebViewCreated;

  @override
  State<StatefulWidget> createState() {
    return _WebViewWidgetState();
  }
}

class _WebViewWidgetState extends State<WebViewWidget> {
  late InAppWebViewController? _webViewController;
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      javaScriptEnabled: true, // 必须启用
      javaScriptCanOpenWindowsAutomatically: true,
      mediaPlaybackRequiresUserGesture: false,
      allowUniversalAccessFromFileURLs: true,
      allowFileAccessFromFileURLs: true,
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
      builtInZoomControls: false,
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
      allowsBackForwardNavigationGestures: true,
      allowsLinkPreview: true,
      allowsAirPlayForMediaPlayback: true,
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      key: webViewKey,
      initialOptions: options,
      onWebViewCreated: (controller) {
        _webViewController = controller;
        if (widget.clearCache == true) {
          _webViewController?.clearCache();
        }
        if (widget.onWebViewCreated == null) {
          if (widget.webViewType == WebViewWidgetType.HTMLTEXT) {
            _webViewController?.loadData(data: widget.loadResource);
          } else if (widget.webViewType == WebViewWidgetType.URL) {
            _webViewController?.loadUrl(
                urlRequest: URLRequest(url: WebUri(widget.loadResource)));
          }
        } else {
          widget.onWebViewCreated?.call(controller);
        }

        widget.jsChannelMap?.forEach(
          (handlerName, callback) {
            _webViewController?.addJavaScriptHandler(
              handlerName: handlerName ?? '',
              callback: callback,
            );
          },
        );
      },
      onConsoleMessage: (controller, consoleMessage) {
        print(consoleMessage);
      },
      onProgressChanged: (controller, progress) {
        print('WebView is loading (progress : $progress%)');
      },
      onLoadStart: (controller, url) {
        Loading.showLoading(Duration(seconds: 30));
      },
      onLoadStop: (controller, url) {
        Loading.hideLoading();
      },
      onLoadError:(InAppWebViewController? controller, Uri? url, int code, String message) {
        Loading.hideLoading();
      },
    );
  }
}
