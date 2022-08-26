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
  late String result;

  @override
  void initState() {
    textEditingController1 = TextEditingController();
    textEditingController2 = TextEditingController();
    total = 0;
    result= "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('덧셈 구하기'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: textEditingController1,
            decoration: const InputDecoration(labelText: '첫번째 숫자를 입력하세요'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: textEditingController2,
            decoration: const InputDecoration(labelText: '두번째 숫자를 입력하세요'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              if(textEditingController1.text.trim().isEmpty || 
                  textEditingController2.text.trim().isEmpty){
                    errorSnackbar();
              }else{

              }
              
              if(textEditingController1.text.trim().isNotEmpty && 
                  textEditingController2.text.trim().isNotEmpty){
                    sum();
              }else{

              }
            },
            child: const Text(
              '덧셈계산',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            result ,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
            ),
        ],
      ),
    );
  }

  // Function
  errorSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('글자를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  sum() {
    setState(() {
      total = int.parse(textEditingController1.text) +
          int.parse(textEditingController2.text);
      result = '입력한 두 수의 합은 $total 입니다.'; 
    });
  }
}
