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

  String display = "대한민국";
  String character = "";
  List str = [];
  int strIndex = 0;

  @override
  void initState() {  
    str = display.split('');
    character = str[strIndex];
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
       changeCharacter();
     });
     super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LED 광고'),
        backgroundColor: Colors.grey[600],
      ),
      body: Center(
        child: Text(
          '$character',
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

    );
  }

  // Fuctions

  changeCharacter(){
    setState(() {
        strIndex ++;
        if(strIndex>=display.length){
          strIndex = 0;
          character = str[strIndex];
        }else{
          character += str[strIndex];
        }
    });
  }
} 
