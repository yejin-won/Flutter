import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/correct_page.dart';
import 'package:navigator_lamp_app/message.dart';

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
  late TextEditingController controller;
  late String _imagePath;
  
  @override
  void initState() {
    _imagePath = "images/lamp_on.png";
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main 화면'),
        leading: IconButton(
          onPressed: () {
            //
          },
          icon: const Icon(Icons.home),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CorrectPage() ))
              .then((value) => lampOnOff());
              Message.controller = controller;
            },
            icon: const Icon(
              Icons.edit,
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(labelText: '글자를 입력하세요.'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                _imagePath,
                width: 150,
                height: 300,
              )
            ],
          ),
        ),
      ),
    );
  }

  lampOnOff() {
    setState(() {
      if(Message.lampStatus){
          _imagePath = "images/lamp_on.png";
           Message.lampStatus = true;
      }else{
        _imagePath = "images/lamp_off.png";
        Message.lampStatus = false;
      }
    });
  }
}
