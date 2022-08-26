import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_sol1_app/vol1/controller.dart';
import 'package:navigator_lamp_switch_sol1_app/vol1/message.dart';

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
  late String _lampImage;

  @override
  void initState() {
    _lampImage = "images/lamp_on.png";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (() {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Controller()))
                  .then((value) => getData());
            }),
            icon: const Icon(Icons.edit),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              _lampImage,
              width: 150,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }

  // functions
  getData() {
    setState(() {
      if (Message.lampStatus) {
        if (Message.lampColor) {
          _lampImage = 'images/lamp_on.png';
        } else {
          _lampImage = 'images/lamp_red.png';
        }
      } else {
        _lampImage = 'images/lamp_off.png';
      }
    });
  }
}
