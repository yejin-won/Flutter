import 'package:flutter/material.dart';
import 'package:tabbar_image_app/first_page.dart';
import 'package:tabbar_image_app/second_page.dart';

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

class _MyHomePageState extends State<MyHomePage> 
    with SingleTickerProviderStateMixin{
  // property
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 2,
      vsync: this,
    );
  }

  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: [
          FirstPage(),SecondPage()
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: controller,
        labelColor: Colors.blueAccent, 
        indicatorColor: Colors.red,
        tabs: [
          Tab(
            icon: Icon(
              Icons.card_giftcard_outlined,
              color: Colors.blueAccent,
            ),
            text: "Button",
          ),
          Tab(
            icon: Icon(
              Icons.card_membership_outlined,
              color: Colors.redAccent,
            ),
            text: "Swipe",
          )
        ],  
      ),
    );
  }
}
