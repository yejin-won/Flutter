import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI 계산기'),
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text('키와 몸무게로 계산한 대략적인 체질량 지수이다.'
             +'\nBMI 지수는 쉽게 측정할 수 있는 키와 몸무게 만으로 간단히' 
             +'\n추정할 수 있어서 유리하다.'
             +'\n다만 기계를 이용해 직접적으로 체지방을 측정한 것이 아니라서'
             +'\n엄밀하지 않다.',
              style: TextStyle(
               fontSize: 15,
               fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'images/bmiValue.png'
              ),
          ],
        ),
      ),
    );
  }
}