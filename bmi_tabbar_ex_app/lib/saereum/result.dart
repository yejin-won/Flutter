import 'package:bmi_tabbar_ex_app/saereum/message.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  late double heigth;
  late double weigth;
  late double bmi;
  late String result;

  @override
  void initState() {
    heigth = double.parse(Message.heigth) / 100;
    weigth = double.parse(Message.weigth);
    bmi = weigth / (heigth * heigth);
    if (bmi < 18.5) {
      result = '저체중';
    } else if (bmi < 23) {
      result = '정상';
    } else if (bmi < 25) {
      result = '과체중';
    } else if (bmi < 30) {
      result = '비만';
    } else {
      result = '고도비만';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('BMI(체질량지수) 결과'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/bmi.jpeg'),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("입력하신 키는 ", style: TextStyle(fontSize: 18)),
                    Text(
                      Message.heigth,
                      style: TextStyle(fontSize: 18, color: Colors.amber[800]),
                    ),
                    const Text("cm 이며,", style: TextStyle(fontSize: 18)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("입력하신 몸무게는 ", style: TextStyle(fontSize: 18)),
                    Text(
                      Message.weigth,
                      style: TextStyle(fontSize: 18, color: Colors.amber[800]),
                    ),
                    const Text("kg 입니다.", style: TextStyle(fontSize: 18)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("귀하는 현재 ", style: TextStyle(fontSize: 18)),
                    Text(
                      result,
                      style: TextStyle(fontSize: 25, color: Colors.blue[400]),
                    ),
                    const Text(" 입니다.", style: TextStyle(fontSize: 18)),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.amber),
                onPressed: () {
                  Navigator.pop(context);
                  //Message.bmis.add(heigth, weigth, bmi);
                },
                child: const Text('되돌아가기')),
          ],
        ),
      ),
    );
  }
}
