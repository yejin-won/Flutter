import 'package:flutter/material.dart';
import 'package:navigator_appbar_exercise_app/receivedmail.dart';
import 'package:navigator_appbar_exercise_app/screen.dart';
import 'package:navigator_appbar_exercise_app/sendmail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' :(context) => const Screen(),
        '/sendmail' : (context) => const SendMail(),
        '/receivedmail' :(context) => const ReceivedMail(),
      },
    );
  }
}

