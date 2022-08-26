import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navigator02_app/pages/pikachu1.dart';
import 'package:navigator02_app/pages/pikachu2.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
        backgroundColor: Colors.yellow[700],
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => const Pikachu1()
                  ));
              },
              child: const Text('Show me Pikachu 1')
              ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => const Pikachu2()
                  ));
              },
              child: const Text('Show me Pikachu 2')
              ),
          ],
        ),
      ),
    );
  }
}