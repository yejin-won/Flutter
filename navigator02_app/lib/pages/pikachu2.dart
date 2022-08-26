import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navigator02_app/pages/FirstPage.dart';

class Pikachu2 extends StatelessWidget {
  const Pikachu2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Pikachu 2'),
        backgroundColor: Colors.yellow[700],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
              child: Image.asset('images/pika2.png'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 250, 20, 5),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FirstPage(),
                      ),
                    );
                  },
                  child: const Text('back')),
            ),
          ],
        ),
      ),
    );
  }
}
