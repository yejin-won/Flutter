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
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool switchValue;
  late Color switchColor;

  @override
  void initState() {
    switchValue = false;
    switchColor = Colors.blue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                //
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(switchColor),
              ),
              child: const Text('flutter'),
            ),
            Switch(
              value: switchValue, // 화면에 보여지는 value
              onChanged: (value) {
                // 사용자가 움직이는 거에 따라 나타나는 value
                setState(() {
                  switchValue = value;
                  _chagecolor();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

// ---functions
  _chagecolor() {
    if (switchValue == true) {
      switchColor = Colors.red;
    } else {
      switchColor = Colors.blue;
    }
  }
}
