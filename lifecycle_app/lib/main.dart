import 'dart:math';

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
  late String _buttonState; // class 내 전역변수
  late String _buttonPhrase;
  late Color _buttonColor;

  @override
  void initState() {
    _buttonState = "OFF"; 
    _buttonPhrase = "버튼을 누르세요";      // 초기값
    _buttonColor = Colors.red;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Life Cycle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _pressBtn();
                _onClick();
                _chageColor();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(_buttonColor),
              ),
              child: Text(_buttonPhrase),
            ),
            const SizedBox(
              height: 50,
            ),
            const SizedBox(
              width: 10,
            ),
            Text("버튼 상태 : $_buttonState"),
          ],
        ),
      ),
    );
  }

// --Functions
  _onClick() {
    setState(() {
      if (_buttonState == "OFF") {
        _buttonState = "ON";
      } else {
        _buttonState = "OFF";
      }
    });

  }
  _pressBtn(){
    setState(() {
      if(_buttonPhrase == "버튼을 누르세요"){
        _buttonPhrase = "Press the button";
      }else{
        _buttonPhrase = "버튼을 누르세요";
      }
    });
  }

  _chageColor(){
    setState(() { 
        if(_buttonState == "ON"){
          _buttonColor = Colors.green;
        }else{
          _buttonColor = Colors.red;
        }
    });
  }
}