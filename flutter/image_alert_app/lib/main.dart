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
        primarySwatch: Colors.red,
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
  late String _lampImage; // Image Name

  @override
  void initState() {
    _lampImage = 'images/lamp_on.png';
    super.initState();
  }
  // initState까지는 화면이 뜨기전에 실행되는 것, 초기화면의 모양

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert를 이용한 메시지 출력'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _lampImage,
                    width: 300,
                    height: 400, // 초기화면이 램프on인 사진이 뜨는 것임
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      decisionOn();
                    });
                  }, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: const Text(
                    '켜기',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                TextButton(
                  onPressed: () {
                    decisionOff();
                  }, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: const Text(
                    '끄기',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    ),
                    ),
              ],
            ),
             
          ],
        ),
      ),
    );
  }

  // Functions

  _showDialog(BuildContext context){
    showDialog(
      context: context, 
      builder: (BuildContext ctx){
        return AlertDialog(
          title: const Text('경고'),
          content: const Text('현재 램프가 켜진 상태입니다.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              }, 
              child: const Center
              (child: Text(
                '네.알겠습니다'
                ),), 
              ),
          ],
        );
      }
      );
  }

  _showDialog1(BuildContext context){
    showDialog(
      context: context, 
      builder: (BuildContext ctx){
        return AlertDialog(
          title: const Text('램프 끄기'),
          content: const Text('램프를 끄시겠습니까?'),
          actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                      setState(() {
                      _lampImage = 'images/lamp_off.png';
                      });
                    }, 
                    child: const Text('네'),),
                  const SizedBox(width: 20,),
                  TextButton(
                    onPressed: () {
                      setState(() {
                      Navigator.of(ctx).pop();
                      _lampImage = 'images/lamp_on.png';
                      });
                    }, 
                    child: const Text('아니요'),
                    ),
                ],
              ), 
          ],
        );
      }
      );
  }

  _showDialog2(BuildContext context){
    showDialog(
      context: context, 
      builder: (BuildContext ctx){
        return AlertDialog(
          title: const Text('경고'),
          content: const Text('현재 램프가 꺼진 상태입니다.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              }, 
              child: const Center(
                child: Text(
                  '네.알겠습니다',
                  ),
              ), 
              ),
          ],
        );
      }
      );
  }

  decisionOn() {
    if (_lampImage != 'images/lamp_on.png') {
      _lampImage = 'images/lamp_on.png';
    } else {
      _showDialog(context);
    }
  }

  decisionOff() {
    if (_lampImage != 'images/lamp_off.png') {
      _showDialog1(context);
    } else {
      _showDialog2(context);
    }
  }

}