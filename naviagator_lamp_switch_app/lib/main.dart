import 'package:flutter/material.dart';
import 'package:naviagator_lamp_switch_app/correct_page.dart';
import 'package:naviagator_lamp_switch_app/message.dart';

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

  // property
  late String imageName;

  @override
  void initState() {
    imageName = "images/lamp_off.png";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main 화면'),
        actions: [
          IconButton(
            onPressed: (() {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const CorrectPage())
                ).then((value) => rebuild());
            }),
            icon: const Icon(Icons.add_reaction_outlined),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageName,
              width: 300,
              height: 400,
            ),
          ],
        ),
      ),
    );
  }
  rebuild(){
    setState(() {
      imageName = Message.imageName;
    });
  }
}

