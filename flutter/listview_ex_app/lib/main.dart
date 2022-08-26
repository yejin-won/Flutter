import 'package:flutter/material.dart';
import 'package:listview_ex_app/first_page.dart';
import 'package:listview_ex_app/nation_item.dart';
import 'package:listview_ex_app/second_page.dart';

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
        primarySwatch: Colors.deepPurple,
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
  
  //property
  late TabController controller;
  List<Nation> nationList = [];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    nationList.add(Nation(
      imagePath: 'images/austria.png', 
      nationName: '오스트리아'
      ));
    nationList.add(Nation(
      imagePath: 'images/belgium.png', 
      nationName: '벨기에'
      ));
    nationList.add(Nation(
      imagePath: 'images/estonia.png', 
      nationName: '에스토니아'
      ));
    nationList.add(Nation(
      imagePath: 'images/france.png', 
      nationName: '프랑스'
      ));
    nationList.add(Nation(
      imagePath: 'images/germany.png', 
      nationName: '독일'
      ));
    nationList.add(Nation(
      imagePath: 'images/hungary.png', 
      nationName: '헝가리'
      ));
    nationList.add(Nation(
      imagePath: 'images/italy.png', 
      nationName: '이탈리아'
      ));
    nationList.add(Nation(
      imagePath: 'images/latvia.png', 
      nationName: '라트비아'
      ));
    nationList.add(Nation(
      imagePath: 'images/lithuania.png', 
      nationName: '리투아니아'
      ));
    nationList.add(Nation(
      imagePath: 'images/luxemburg.png', 
      nationName: '룩셈부르크'
      ));
    nationList.add(Nation(
      imagePath: 'images/netherland.png', 
      nationName: '네덜란드'
      ));
    nationList.add(Nation(
      imagePath: 'images/romania.png', 
      nationName: '루마니아'
      ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('국가명 맞추기'),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          FirstPage(list: nationList),
          SecondPage(list: nationList,)
        ],
        ),
        bottomNavigationBar: Container(
          color: Colors.purpleAccent[50],
          height: 70,
          child: TabBar(
            controller: controller,
            tabs: const [
              Tab(
                icon: Icon(
                  Icons.looks_one,
                  color: Colors.amberAccent,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.looks_two,
                  color: Colors.redAccent,
                ),
              )
            ] 
          ),
        ),
    );
  }
}