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
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[500],
      appBar: AppBar(
        backgroundColor: Colors.orange[800],
        title: const Text('영웅 Card'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/lee.jpeg'),
              radius: 70,
            ),
            Divider(
              height: 10,
              thickness: 2.5,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      '성웅',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        letterSpacing: 2,
                      ),
                      ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '이순신 장군',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        '전적',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '62전 62승',
                        style: TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          wordSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check_circle_outline
                    ),
                    Text(
                      '  옥포해전',
                    ),
                  ],
                ),
                 Row(
                   children: [
                     Icon(
                          Icons.check_circle_outline
                        ),
                        Text(
                          '  사천포해전'
                        ),
                   ],
                 ),
                 Row(
                   children: [
                     Icon(
                          Icons.check_circle_outline
                        ),
                        Text(
                          '  당포해전'
                        ),
                   ],
                 ),
                 Row(
                   children: [
                     Icon(
                          Icons.check_circle_outline
                        ),
                        Text(
                          '  한산도대첩'
                        ),
                   ],
                 ),
                 Row(
                   children: [
                     Icon(
                          Icons.check_circle_outline
                        ),
                        Text(
                          '  부산포해전'
                        ),
                   ],
                 ),
                 Row(
                   children: [
                     Icon(
                          Icons.check_circle_outline
                        ),
                        Text(
                          '  명량해전'
                        ),
                   ],
                 ),
                 Row(
                   children: [
                     Icon(
                          Icons.check_circle_outline
                        ),
                        Text(
                          '  노량해전'
                        ),
                   ],
                 ),
                 CircleAvatar(
                   backgroundColor: Colors.orange[500],
                   backgroundImage: AssetImage('assets/turtle.gif'),
                   radius: 50,
                 ),
              ],
            )
          ],
        ),
      ),
    );
  }
}