import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // alias하기

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
  late List data;

  @override
  void initState() {
    super.initState();
    data = [];
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Test'),
      ),
      body: Center(
        // android는 ios와 달리 center를 지정하지 않으면 indicator(뺑뺑도는거)가 상단에 위치
        child: data.isEmpty
            ? const Text('데이터가 없습니다.')
            : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context,index){
                return Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            'Code', 'Name', 'Dept','Phone'
                          ].map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    '$e : ',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                  Text(
                                    data[index][e.toLowerCase()],
                                    ),
                                ],
                              ),
                            )).toList(),
                        ),
                      ),
                    ],
                  ),);
              }),
      ),
    );
  }

  // Functions

  Future<bool> getJSONData() async {
    // getJSONData() 와 build 동시에 실행
    var url =
        Uri.parse('http://localhost:8080/Flutter/student_query_flutter.jsp'); // 해당주소를 가져옴
    var response =
        await http.get(url); // http가 get하면서 url 가져옴 // data는 준비되고 기다리는 중

    setState(() { // 화면 구성에 대해 쓰는 것으로 화면이 계속 바뀌니까 setstate((){}); 해야함 
      var dataConvertedJSON =
          json.decode(utf8.decode(response.bodyBytes)); //한글 안 깨지게
      // Map type 변환
      List result = dataConvertedJSON['results'];
      // key value(results)로 해당 데이터를 result라는 변수에 저장 
      data.addAll(result); // data에 result와 동일한 데이터가 List로 추가됨
    });

    // print(result);
    // 전체 [0],[1]
    // [0]에서 code:S001를 보려면 [0]['code'] = > S001 (Map 형식이므로 key값으로 데이터 불러야함)
    // 즉, S001을 볼 때, [0][0]으로 부를 수 없음

    return true;
  }
} // END
