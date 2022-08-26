import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class sitePage extends StatefulWidget {
  final String siteName;
  const sitePage({Key? key,required this.siteName}) : super(key: key);

  @override
  State<sitePage> createState() => _sitePageState();
}

class _sitePageState extends State<sitePage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true; // for indicator
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://${widget.siteName}',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController); // 다 불러옴(화면 보여주는 기능 줌)
            },
            onPageFinished: (finish) {
              // 로딩이 끝나면(뺑뺑도는 것 안 보임)
              setState(() {
                isLoading = false;
              });
            },
            onPageStarted: (start) {
              // 로딩이 시작되면(데이터불러오기위해 뺑뺑도는것)
              setState(() {
                isLoading = true;
              });
            },
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      ),
      floatingActionButton: FutureBuilder<WebViewController>(
          future: _controller.future,
          builder: (BuildContext context,
              AsyncSnapshot<WebViewController> controller) {
            if (controller.hasData) {
              // controller가 돌아갈 data를 가지고 있다면
              return FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: () {
                    controller.data!
                        .goBack(); // 데이터가 있을수도 없을수도 있으니 optional
                  }, // 데이터가 있으면 FloationAtcionbtn으로
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    ));
            }
            return Stack(); // 그렇지 않으면 stack으로
          }),
    );
  }
  // Functions
  _reloadSite() {
    _controller.future.then((value) => value.loadUrl('https://${widget.siteName}'));
  }
  // 앱과 달리 계속 연결되어 있지 않고 한 번 값을 보내면 연결이 끊키기 때문에 다시 연결을
  // 해줘야 한다.
}