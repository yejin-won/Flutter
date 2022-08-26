import 'package:bmi_tabbar_ex_app/jinyoung/message.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String height = Message.height;
  String weight = Message.weight;
  String imageName = Message.imageName;
  String bmiName = Message.bmiName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("결과보기"),
          backgroundColor: Colors.green[800],
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                imageName,
                height: 400,
                width: 200,
              ),
              Text("당신은 $bmiName 입니다.",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),)
            ],
          ),
        ));
  }
}// End 