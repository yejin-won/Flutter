import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  // property
  late List imageName;
  late int currentName;

  @override
  void initState() {
    imageName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];
    currentName = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('이미지 변경하기'),
      ),
      body: SimpleGestureDetector(
        onHorizontalSwipe: _onHorizontalSwipe,
        onVerticalSwipe: _onVerticalSwipe,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
              imageName[currentName],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              ),
              Image.asset('images/${imageName[currentName]}'),
            ],
          ),
        ),
      ),
    );
  }

  _onHorizontalSwipe(SwipeDirection direction){
    setState(() {
      if(direction == SwipeDirection.left){
        currentName += 1;
        if(currentName>=imageName.length){
          currentName = 0;
        }
      }else{
        currentName -= 1;
        if(currentName<0){
          currentName = imageName.length-1; 
        }
       }
    });
  }
  _onVerticalSwipe(SwipeDirection direction){
    setState(() {
      if(direction == SwipeDirection.down){
        currentName += 1;
        if(currentName>=imageName.length){
          currentName = 0;
        }
      }else{
        currentName -= 1;
        if(currentName<0){
          currentName = imageName.length-1; 
        }
       }
    });
  }
}