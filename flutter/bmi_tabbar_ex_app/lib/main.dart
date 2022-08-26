import 'package:bmi_tabbar_ex_app/jinyoung/homepage.dart';
import 'package:bmi_tabbar_ex_app/jinyoung/inputpage.dart';
import 'package:bmi_tabbar_ex_app/jinyoung/resultpage.dart';
import 'package:bmi_tabbar_ex_app/jiye/calc.dart';
import 'package:bmi_tabbar_ex_app/jiye/result.dart';
import 'package:bmi_tabbar_ex_app/saereum/exercise.dart';
import 'package:bmi_tabbar_ex_app/saereum/exercise2.dart';
import 'package:bmi_tabbar_ex_app/saereum/home.dart';
import 'package:bmi_tabbar_ex_app/saereum/report.dart';
import 'package:bmi_tabbar_ex_app/saereum/result.dart';
import 'package:bmi_tabbar_ex_app/yejin/screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' : (context) => const MyHomePage(),
        'screen' :(context) => const Screen(), // Won
        
        'homepage' :(context) => const HomePage(), // Kang
         '/input' :(context) => const InputPage(),
        '/result' :(context) => const ResultPage(),

        'main':(context) =>  const Main(), // Lee-S
        'result': (context) => const Result(), 
        'exec': (context) => const Exe(),
        'exec2': (context) => const Exe2(),
        'report': (context) => const Report(),

        "calc" :(context) => const Calc(), // Lee-J
        "/Result1": (context) => const Result1(),

        // 'fifth' :(context) => const FifthPage(), // Jung
        
      },
      initialRoute: '/',
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
    controller = TabController(
      length: 4, 
      vsync: this,
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: [
          Screen(),HomePage(),Main(),Calc()
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: controller,
        labelColor: Colors.black,
        indicatorColor: Colors.red,
        tabs: [
          Tab(
            icon: Icon(
              Icons.looks_one_outlined,
              color: Colors.blue,
            ),
            text: "Won",
          ),
          Tab(
            icon: Icon(
              Icons.looks_one_outlined,
              color: Colors.blue,
            ),
            text: "Kang",
          ),
          Tab(
            icon: Icon(
              Icons.looks_3_outlined,
              color: Colors.blue,
            ),
            text: "Lee-S",
          ),
          Tab(
            icon: Icon(
              Icons.looks_4_outlined,
              color: Colors.blue,
            ),
            text: "Lee-J",
          ),
          // Tab(
          //   icon: Icon(
          //     Icons.looks_5_outlined,
          //     color: Colors.blue,
          //   ),
          //   text: "Jung",
          // )
        ],
        ),
    );
  }
}