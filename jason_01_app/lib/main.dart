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
        title: const Text('JSON Movie'),
      ),
      body: Center(
        child: data.isEmpty
            ? const Text('데이터가 없습니다,')
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8, 3, 3, 3),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            if(index%2==0)
                            SizedBox(
                              width: 200,
                              child: Card(
                                color: index % 2 == 0
                                    ? Colors.amberAccent[100]
                                    : Colors.blueGrey[100],
                                child: Row(
                                  children: [
                                    Image.network(
                                      data[index]['image'],
                                      width: 110,
                                      height: 110,
                                    ),
                                    Text(
                                      data[index]['title'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                ),
                            ),
                            if(index%2==0)
                            SizedBox(
                              width: 200,
                              child: Card(
                                color: index % 2 != 0
                                    ? Colors.amberAccent[100]
                                    : Colors.blueGrey[100],
                                child: Row(
                                  children: [
                                    Image.network(
                                      data[index+1]['image'],
                                      width: 110,
                                      height: 110,
                                    ),
                                    Text(
                                      data[index+1]['title'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                })),
      ),
    );
  }

  // Funtions

  Future<bool> getJSONData() async {
    var url = Uri.parse('https://zeushahn.github.io/Test/movies.json');
    var response = await http.get(url);

    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      List result = dataConvertedJSON['results'];
      data.addAll(result);
    });

    return true;
  }
}
