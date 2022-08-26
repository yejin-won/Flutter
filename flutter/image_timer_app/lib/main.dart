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

  //property
  late List imageName;
  late int currentImage;

  @override
  void initState() {
    imageName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png'];
    currentImage = 0;
    // Timer 설치

    Timer.periodic(
      const Duration(seconds: 3), (Timer timer) {
        changeImage();
       },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3초마다 이미지 무한 반복'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                imageName[currentImage]
                ),
              Image.asset('images/${imageName[currentImage]}',
              width: 350,
              height: 600,
              ), 
            ],
          ),
      ),
    );
  }

  // functions
  changeImage(){
    setState(() {
      currentImage++;
      if(currentImage>=imageName.length){
        currentImage = 0;
      }
    });
  }
}