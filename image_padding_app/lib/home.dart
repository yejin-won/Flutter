import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Image Padding'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                'assets/pika1.png',
              ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                'assets/pika2.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child : Image.asset(
                'assets/pika3.png',
                ),
              )
            ],
          ),
          ),
      ),
    );
  }
}