import 'package:bmi_tabbar_ex_app/main.dart';
import 'package:flutter/material.dart';

import 'messge.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

late String numHeight;
late String numWeight;
late double bmi;
late String result;

@override
  void initState() {
    bmi = Message.bmi;
    numHeight = Message.numHeight;
    numWeight = Message.numWeight;
    result = Message.result;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI 계산기'),
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '귀하의 BMI 지수는 $result ',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Image.asset('images/bmiIndex.png'),
            TextButton(
              onPressed: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const MyHomePage()),);
              }, 
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: const Text('Back'),),
          ],
        ),
      ),
    );
  }
}