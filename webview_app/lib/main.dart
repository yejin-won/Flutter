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
  String siteName = "www.google.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Column(
            children: [
              const Text('WebView'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)
                    ),
                    onPressed: (){
                      setState(() {
                        siteName = "www.google.com";
                      });
                      _reloadSite();
                    }, 
                    child: const Text('Google'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)
                    ),
                    onPressed: (){
                      setState(() {
                        siteName = "www.naver.com";
                      });
                      _reloadSite();
                    }, 
                    child: const Text('Naver'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue)
                    ),
                    onPressed: (){
                      setState(() {
                        siteName = "www.daum.net";
                      });
                      _reloadSite();
                    }, 
                    child: const Text('Daum'),
                    ),
                ],
              ),
            ],
          ),
        ),
        toolbarHeight: 100,
        backgroundColor: Colors.amberAccent,
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://$siteName',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController){
              _controller.complete(webViewController); // 다 불러옴(화면 보여주는 기능 줌)
            },
            onPageFinished: (finish){ // 로딩이 끝나면
              setState(() {
                isLoading = false; 
              });
            },
            onPageStarted: (start){
              setState(() {
                isLoading = true;
              });
            },
          ),
          isLoading ? const Center(
            child: CircularProgressIndicator(),
          )
          : Stack(),
        ],
      ),
      floatingActionButton: FutureBuilder<WebViewController>(
        future: _controller.future,
        builder: (BuildContext context,AsyncSnapshot<WebViewController> controller){
          if(controller.hasData){ // controller가 돌아갈 data를 가지고 있다면
            return FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: (){
                controller.data!.goBack(); // 데이터가 있을수도 없을수도 있으니 optional
             },
             child: const Icon(Icons.arrow_back)
              );
          }
          return Stack();
        }
      ),
    );
  }

  // Functions
  _reloadSite(){
    _controller.future.then((value) => value.loadUrl('https://$siteName'));
  }

}
