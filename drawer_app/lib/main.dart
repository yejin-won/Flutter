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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer'),
      ),
      body: const Center(
        child: Text('Drawer'),
      ),
      drawer: Drawer(
        child: Padding(
          padding: EdgeInsets.zero,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/pika1.png'),
                ),
                otherAccountsPictures: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      'images/pika2.png',
                    ),
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      'images/pika3.png',
                    ),
                  ),
                ],
                accountName: const Text('Pikachu'), 
                accountEmail: const Text('pikachu@naver.com'),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )
                ),
                ),
                ListTile(
                  onTap: () {
                    
                  },
                  leading: const Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  title: const Text('Home'),
                  trailing: const Icon(
                    Icons.add,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}