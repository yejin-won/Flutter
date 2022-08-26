import 'package:flutter/material.dart';

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

  // property
  late TextEditingController textEditingController1;
  late TextEditingController textEditingController2;
  late int total;

  @override
  void initState() {
    textEditingController1 = TextEditingController();
    textEditingController2 = TextEditingController();
    total = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('간단한 덧셈 계산기'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              '덧셈 결과 : $total',
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          TextField(
            controller: textEditingController1,
            decoration: const InputDecoration(labelText: '숫자를 입력하세요'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: textEditingController2,
            decoration: const InputDecoration(labelText: '숫자를 입력하세요'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              sum();
            }, 
            style: ElevatedButton.styleFrom(
              minimumSize: Size(700, 50)
            ),
            child: Row(
              children: const[
                Icon(
                  Icons.add,
                  ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  '덧셈계산',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  ),
              ],
            )
            ),
        ],
      ),
    );
  }

  // Function
  sum(){
    setState(() {
      total = int.parse(textEditingController1.text) 
                + int.parse(textEditingController2.text);
    });
  }
}