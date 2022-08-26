import 'package:flutter/material.dart';
import 'package:navigator_class_app/screen.dart';
import 'package:navigator_class_app/screen1st.dart';
import 'package:navigator_class_app/screen2nd.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {            // controller 역할과 유사
        '/' :(context) => const Screen(),
        '/1st' :(context) => const Screen1st(),
        '/2nd' :(context) {
          return const Screen2nd();
        },
      },
      initialRoute: '/',  // 초기정보를 이용해 처음에 앱을 키자마자 screen 화면이 나옴
    );
  }
}

// route 정보만 둠