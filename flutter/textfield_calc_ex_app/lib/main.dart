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
  late TextEditingController add;
  late TextEditingController sub;
  late TextEditingController mul;
  late TextEditingController div;

  @override
  void initState() {
    textEditingController1 = TextEditingController();
    textEditingController2 = TextEditingController();
    add = TextEditingController();
    sub = TextEditingController();
    mul = TextEditingController();
    div = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('간단한 계산기'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: textEditingController1,
              decoration: const InputDecoration(labelText: ' 첫번째 숫자를 입력하세요'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: textEditingController2,
              decoration: const InputDecoration(labelText: ' 두번째 숫자를 입력하세요'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if(textEditingController1.text.trim().isEmpty ||
                            textEditingController2.text.trim().isEmpty ){
                              errorSnackbar();
                        }
                    if(textEditingController1.text.trim().isNotEmpty &&
                            textEditingController2.text.trim().isNotEmpty ){
                              calc();
                        }
                  }, 
                  child: const Text('계산하기'),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ElevatedButton(
                  onPressed: () {
                    textEditingController1.text = '';
                    textEditingController2.text = '';
                    add.text = '';
                    sub.text = '';
                    mul.text = '';
                    div.text = '';
                  }, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: const Text('지우기')
                  ),
              ],
            ),
            TextField(
              controller: add,
              decoration: const InputDecoration(labelText: ' 덧셈 결과'),
              keyboardType: TextInputType.number,
              readOnly: true,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: sub,
              decoration: const InputDecoration(labelText: ' 뺄셈 결과'),
              keyboardType: TextInputType.number,
              readOnly: true,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: mul,
              decoration: const InputDecoration(labelText: ' 곱셈 결과'),
              keyboardType: TextInputType.number,
              readOnly: true,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: div,
              decoration: const InputDecoration(labelText: ' 나눗셈 결과'),
              keyboardType: TextInputType.number,
              readOnly: true,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  // Function
  errorSnackbar(){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('숫자를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
        ),
    );
  }

  calc(){
    add.text = (int.parse(textEditingController1.text) 
            + int.parse(textEditingController2.text)).toString();
    sub.text = (int.parse(textEditingController1.text) 
            - int.parse(textEditingController2.text)).toString();
    mul.text = (int.parse(textEditingController1.text) 
            * int.parse(textEditingController2.text)).toString();
    div.text = (double.parse(textEditingController1.text) 
            / double.parse(textEditingController2.text)).toString();
  }

}