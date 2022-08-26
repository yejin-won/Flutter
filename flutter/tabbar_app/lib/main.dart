import 'package:flutter/material.dart';
import 'package:tabbar_app/first_page.dart';
import 'package:tabbar_app/second_page.dart';

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
// tabbar는 main page에서...
class _MyHomePageState extends State<MyHomePage> 
        with SingleTickerProviderStateMixin{ // 상속을 여러개 하기위해 with

  // Property
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 2, // tabbar의 개수 
      vsync: this, // main에서 tabbar 사용
      );
  }

  void dispose(){
    super.dispose();
    controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Tab Bar Test'),
      // ),
      body: TabBarView(
        controller : controller,
        children: const [
          FirstPage(),SecondPage(),
        ],
        ),
        bottomNavigationBar: Container(
          color: Colors.amberAccent,
          height: 100,
          child: TabBar(
            controller: controller,
            labelColor: Colors.blueAccent,
            indicatorColor: Colors.red, // 아이콘 밑에 줄쳐져있는거 현재 어느 페이지이라 알려줌
            tabs: [
              Tab(
                icon:  Icon(
                  Icons.looks_one,
                  color: Colors.blue,
                ),
                text: "One",
              ),
              Tab(
                icon:  Icon(
                  Icons.looks_two,
                  color: Colors.red, 
                ),
                text: "Two",
              ),
            ]
            ),
        ),
    );
  }
}