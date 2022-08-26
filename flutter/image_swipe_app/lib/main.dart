import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text('Image Swiping'),
      ),
      body: SimpleGestureDetector(
        onHorizontalSwipe: _onHorizontalSwipe,
        onVerticalSwipe: _onVerticalSwipe,
        child: Center(
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
      ),
    );
  }

  // Functions
  _onHorizontalSwipe(SwipeDirection direction){
    setState(() {
      if(direction == SwipeDirection.left){
        currentImage += 1;
        if(currentImage>=imageName.length){
          currentImage = 0;
        }
      }else{
        currentImage -= 1;
        if(currentImage<0){
          currentImage = imageName.length-1; // length는 1,2,3...이런것이므로 -1함
        }
       }
    });
  }
  _onVerticalSwipe(SwipeDirection direction){
    setState(() {
      if(direction == SwipeDirection.down){
        currentImage += 1;
        if(currentImage>=imageName.length){
          currentImage = 0;
        }
      }else{
        currentImage -= 1;
        if(currentImage<0){
          currentImage = imageName.length-1; // length는 1,2,3...이런것이므로 -1함
        }
       }
    });
  }

}