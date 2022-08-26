import 'package:flutter/material.dart';

class Exe extends StatelessWidget {
  const Exe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('쉽게 살빼기'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '그런건 업서.. 돌아가..',
              style: TextStyle(fontSize: 35, color: Colors.black54),
            ),
            Image.asset('images/ohgu.jpg'),
            const SizedBox(
              height: 50,
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
