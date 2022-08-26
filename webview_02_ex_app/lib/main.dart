// main.dart

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true; // for indicator
  String siteName = "www.daum.net"; // 앱 실행 시 보여지는 사이트 초기값 지정
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Floating Button WebView',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.amberAccent,
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://$siteName',
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
              return SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 10, 10, 10),
                      child: FloatingActionButton(
                          backgroundColor: Colors.red,
                          onPressed: () {
                            controller.data!
                                .goBack(); // 데이터가 있을수도 없을수도 있으니 optional
                          }, // 데이터가 있으면 FloationAtcionbtn으로
                          child: const Icon(Icons.arrow_back)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: FloatingActionButton(
                          backgroundColor: Colors.amberAccent[700],
                          onPressed: () {
                            controller.data!
                                .reload(); // 데이터가 있을수도 없을수도 있으니 optional
                          }, // 데이터가 있으면 FloationAtcionbtn으로
                          child: const Icon(Icons.replay)),
                    ),
                   
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                      child: FloatingActionButton(
                        backgroundColor: Colors.blue,
                        onPressed: () {
                          controller.data!
                              .goForward(); // 데이터가 있을수도 없을수도 있으니 optional
                        }, // 데이터가 있으면 FloationAtcionbtn으로
                        child: const Icon(Icons.arrow_forward),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Stack(); // 그렇지 않으면 stack으로
          }),
    );
  }

  // Functions
  _reloadSite() {
    _controller.future.then((value) => value.loadUrl('https://$siteName'));
  }
  // 앱과 달리 계속 연결되어 있지 않고 한 번 값을 보내면 연결이 끊키기 때문에 다시 연결을
  // 해줘야 한다.
}
