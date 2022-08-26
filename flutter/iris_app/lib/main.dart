import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // property
  final seLencontroller = TextEditingController();
  final seWidcontroller = TextEditingController();
  final peLencontroller = TextEditingController();
  final peWidcontroller = TextEditingController();

  late String imagePath = 'images/all.jpg';
  String result = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap:(() {
          FocusScope.of(context).unfocus();
        }),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Iris 품종 예측'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: seLencontroller,
                  decoration:
                      const InputDecoration(labelText: 'Sepal.Length의 크기를 입력하세요'),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: seWidcontroller,
                  decoration:
                      const InputDecoration(labelText: 'Sepal.Width의 크기를 입력하세요'),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: peLencontroller,
                  decoration:
                      const InputDecoration(labelText: 'Petal.Length의 크기를 입력하세요'),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: peWidcontroller,
                  decoration:
                      const InputDecoration(labelText: 'Petal.Width의 크기를 입력하세요'),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (seLencontroller.text.isNotEmpty ||
                        seWidcontroller.text.isNotEmpty ||
                        peLencontroller.text.isNotEmpty ||
                        peWidcontroller.text.isNotEmpty) {
                      _clickbtn();
                    } else {
                      setState(() {
                      _errorSnackbar(context);
                       imagePath = "images/all.jpg";  
                      });
                    }
                  },
                  child: const Text('입력'),
                ),
                const SizedBox(
                  height: 5,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(imagePath),
                  radius: 70,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Functions

  rebuild() {}

  _clickbtn() async {
    var url = Uri.parse(
        'http://localhost:8080/Rserve/response_iris.jsp?sepalLength=${seLencontroller.text}&sepalWidth=${seWidcontroller.text}&petalLength=${peLencontroller.text}&petalWidth=${peWidcontroller.text}');
    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      result = dataConvertedJSON['result'];
      imagePath = "images/$result.jpg";
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('품종 예측 결과'),
                content: Text('입력하신 품종의 결과는 $result 입니다.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            });
    });
  }

  _errorSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('정보 입력에 문제가 발생하였습니다.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
}
