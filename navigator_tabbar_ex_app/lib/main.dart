import 'package:flutter/material.dart';
import 'package:navigator_tabbar_ex_app/home.dart';

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
  final idController = TextEditingController();
  final pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage("images/login.png"),
                radius: 100,
              ),
              TextField(
                controller: idController,
                decoration: const InputDecoration(labelText: '사용자 id를 입력하세요'),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: pwController,
                decoration: const InputDecoration(labelText: '사용자 pw를 입력하세요'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  loginSucess();
                },
                child: const Text(
                  'Log in',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //functions
  loginSucess() {
    if (idController.text.trim().isEmpty || pwController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('사용자 id와 pw를 입력하세요.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ));
    } else {
      if (idController.text.trim() == "root" && pwController.text.trim() == "qwer1234") {
        showDialog(
          context: context, 
          barrierDismissible: false,
          builder: (BuildContext ctx){
            return AlertDialog(
              title: const Text(
                '환영 합니다!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                ),
              content: const Text('신분이 확인되었습니다.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: ((context) => const Home())),
                      );
                  }, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)
                  ),
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    ),
                  ),
              ],
            );
          }
          );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('사용자 id와 pw를 맞지 않습니다.'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.blue,
        ));
      }
    }
  }
}
