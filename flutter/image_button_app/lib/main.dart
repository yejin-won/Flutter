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
      'flower_06.png'
    ];
    currentName = 0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('무한 이미지 반복'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                imageName[currentName],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.blueAccent,
                        width: 10,
                      ),
                    ),
                    child: Image.asset(
                      'images/${imageName[currentName]}',
                      width: 400,
                      height: 600,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  left: 290,
                  top: 16,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.amber, width: 5)),
                    child: Image.asset(
                      'images/${imageName[currentName < imageName.length - 1 ? currentName + 1 : 0]}',
                      width: 100,
                      height: 150,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _btnClick(false);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: const Text('<<이전'),
                ),
                SizedBox(
                  width: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    _btnClick(true);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: const Text('다음>>'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Functions
  _btnClick(bool isRight) {
    setState(() {
      if (isRight) {
        currentName += 1;
        if (currentName >= imageName.length) {
          currentName = 0;
        }
      } else {
        currentName -= 1;
        if (currentName < 0) {
          currentName = imageName.length - 1;
        }
      }
    });
  }
}
