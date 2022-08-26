import 'dart:async';

import 'package:flutter/material.dart';

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
  // Property
  late String display;
  List str = [];
  late String character;
  int strIndex = 0;
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    display = "";
    character = "";
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      changeDisplay();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('LED 광고'),
        ),
        body: Center(
          child: Text(
            character, // 화면에 글씨 출력
            style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        drawer: Drawer(
          child: Center(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  width: 320,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const[
                      Text('광고 문구를 입력하세요.',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.amberAccent,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextField(
                    controller: textEditingController,
                    decoration: const InputDecoration(labelText: '글자를 입력하세요'),
                    keyboardType: TextInputType.text,
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    display = textEditingController.text.trim();
                    str = display.split('');
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                      const BorderSide(
                        color: Colors.redAccent,
                        width: 1.0,
                        style: BorderStyle.solid,
                      )),
                  ),
                  child: const Text(
                    '광고문구 생성',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Functions
  changeDisplay() {
    setState(() {
      if (display.length != character.length) {
        character += str[strIndex];
        strIndex++;
      } else {
        strIndex = 0;
        character = "";
      }
    });
  }
}
