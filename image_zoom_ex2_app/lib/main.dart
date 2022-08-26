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
        primarySwatch: Colors.green,
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
  late bool _switch2; // Switch status (for color)
  late bool _switch1; // Switch status (for size)
  late bool _switch; // Switch status (for on/off)

  @override
  void initState() {
    _lampImage = 'images/lamp_on.png';
    _lampHeight = 150;
    _lampWidth = 300;
    _switch2 = false;
    _switch1 = false;
    _switch = true;
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
            SizedBox(
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
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      '전구 색깔',
                      ),
                      Switch(
                        value: _switch2, 
                        onChanged: (value){
                          setState(() {
                            _switch2 = value;
                            decisionLampColor();
                          });
                        }
                        ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      '전구 확대'
                      ),
                    Switch(
                     value: _switch1,
                     onChanged: (value){
                       setState(() {
                         _switch1=value;
                         decisionLampSize();
                       });
                     },
                    ),
                  ],
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
  decisionLampColor(){
    if(_switch2){
      _lampImage = 'images/lamp_red.png';
      if(_switch == false){
        _lampImage = 'images/lamp_off.png';
      }
    }else{
      _lampImage = 'images/lamp_on.png';
       if(_switch == false){
        _lampImage = 'images/lamp_off.png';
      }
    }
  }

  decisionLampSize() {
    if (_switch1) { // switch(false) :축소상태 -> switch(true) 확대로 변경      
      _lampWidth = 300;
      _lampHeight = 600;
    } else {                // switch(true) 확대상태-> switch(false)축소로 변경 
      _lampWidth = 150;
      _lampHeight = 300;
    }
  }

  decisionOnOff() {
    if (_switch) {
      _lampImage = 'images/lamp_on.png';
      if(_switch2 == true){ // switch on일때, 색깔도 true이면 red로 나오게 함
        _lampImage = 'images/lamp_red.png';
      }
    } else {
      _lampImage = 'images/lamp_off.png';
    }
  }

}