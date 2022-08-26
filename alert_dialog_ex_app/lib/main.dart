import 'package:alert_dialog_ex_app/secondpage.dart';
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
        title: const Text('Alert and push'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _showDialog(context),
          child: const Text('Move the 2nd page'),
        ),
      ),
    );
  }
}

// --Functions
_showDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('Page 이동'),
          content: const Text('아래의 버튼을 누르면 페이지 이동을 합니다.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop(); // 해당 code를 적지 않으면 첫 페이지로 가지
                Navigator.push(
                  ctx,
                  MaterialPageRoute(
                    builder: (context) => const SecondPage(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              child: const Text(
                'page 이동',
                style: TextStyle(
                  color: Colors.white,
                ),
                ),
            ),
          ],
        );
      });
}
