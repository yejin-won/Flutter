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
  late double _lampWidth; // Image Width
  late double _lampHeight; // Image Height
  late String _buttonName; // Button Name
  late bool _switch; // Switch status
  late String _lampSizeStatus; // Image Size Status

  @override
  void initState() {
    _lampImage = 'images/lamp_on.png';
    _lampHeight = 150;
    _lampWidth = 300;
    _buttonName = "Image 확대";
    _switch = true;
    _lampSizeStatus = 'small';
    super.initState();
  }
  // initState까지는 화면이 뜨기전에 실행되는 것, 초기화면의 모양

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image확대 및 축소'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
							color: Colors.blueGrey,
              width: 350,
              height: 650,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _lampImage, // 초기화면이 램프on인 사진이 뜨는 것임
                    width: _lampWidth,
                    height: _lampHeight,
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
                      decisionLampSize();
                    });
                  },
                  child: Text(_buttonName),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    const Text(
                      '전구 스위치',
                    ),
                    Switch(
                        value: _switch, // 화면에 보여지는 값
                        onChanged: (value) {  // value가 사용자가 바꾼 값을 switch에
                                              // 알려줘서 setState에서 변경적용 됨
                          setState(() {
                            _switch = value;
                            decisionOnOff();
                          });
                        }),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  // Functions
  decisionOnOff() {
    if (_switch) {
      _lampImage = 'images/lamp_on.png';
    } else {
      _lampImage = 'images/lamp_off.png';
    }
  }

  decisionLampSize() {
    if (_lampSizeStatus == 'small') {
      _lampWidth = 300;
      _lampHeight = 600;
      _buttonName = "Image 축소";
      _lampSizeStatus = 'large';
    } else {
      _lampWidth = 150;
      _lampHeight = 300;
      _buttonName = "Image 확대";
      _lampSizeStatus = 'small';
    }
  }
}