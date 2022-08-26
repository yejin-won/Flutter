import 'package:flutter/material.dart';
import 'package:temp_flutter_app/login_page.dart';
import 'package:temp_flutter_app/siginin_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/':(context) => const LoginPage(),
        '/signin':(context) => const SigninPage(),
      },
      initialRoute: '/',
    );
  }
}

