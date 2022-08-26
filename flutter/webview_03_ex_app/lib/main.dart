import 'package:flutter/material.dart';
import 'package:webview_03_ex_app/sitepage.dart';

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
        primarySwatch: Colors.amber,
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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Webview - Tabbar"),
      ),
      body: TabBarView(
          controller: controller,
          children: const[
            sitePage(siteName: "www.naver.com"), 
            sitePage(siteName: "www.google.com"), 
            sitePage(siteName: "www.daum.net")
            ]),
      bottomNavigationBar: TabBar(
      controller: controller, 
      labelColor: Colors.blue,
      indicatorColor: Colors.amberAccent[800],
      tabs: [
        Tab(
          icon: Image.asset(
           'images/naverLogo.png',
            width: 30,
            height: 30,
          ),
          text: "네이버",
        ),
        Tab(
          icon: Image.asset(
            'images/googleLogo.png',
            width: 30,
            height: 30,
          ),
          text: "구글",
        ),
        Tab(
          icon: Image.asset(
           'images/daumLogo.jpeg',
           width: 30,
           height: 30,
          ),
          text: "다음",
        ),
      ]),
    );
  }
}
