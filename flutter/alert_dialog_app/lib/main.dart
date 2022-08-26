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

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Dialog with Gesture'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _showDialog(context), // _ 는 자바에서 private이랑 같음
          child: const Text(
            'Hello World',
          ),
        ),
      ),
    );
  }
}

// --Functions
_showDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false, // 종료버튼을 눌러야만 창이 닫힘
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('Alert Title'),
          content: const Text('Hello World를 Touch했습니다.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop(); // 버튼 누르면서 ctx의 권한을 context에게 주는 것 
              },
              child: const Text('종료'),
            ),
          ],
        );
      });
}

//   End