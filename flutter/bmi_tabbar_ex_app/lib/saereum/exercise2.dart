import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Exe2 extends StatefulWidget {
  const Exe2({Key? key}) : super(key: key);

  @override
  State<Exe2> createState() => _Exe2State();
}

class _Exe2State extends State<Exe2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('운동법'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '개발 진행중 ...',
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.amber),
                onPressed: () {
                  Navigator.pushNamed(context, 'main');
                  //Navigator.pop(context);
                },
                child: const Text('홈으로 돌아가기')),
          ],
        ),
      ),
    );
  }
}
