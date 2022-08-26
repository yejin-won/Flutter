import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  // Property
  late List imageName;
  late int currentName;

  @override
  void initState() {
    imageName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];
    currentName = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('이미지 변경하기'),
        backgroundColor: Colors.amberAccent[600],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              imageName[currentName],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              'images/${imageName[currentName]}',
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      _btnClick(false);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.amberAccent),
                    ),
                    child: const Text(
                      '이전',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    )),
                const SizedBox(
                  width: 50,
                ),
                TextButton(
                  onPressed: () {
                    _btnClick(true);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.amberAccent),
                  ),
                  child: const Text(
                    '다음',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _btnClick(bool isRight) {
    setState(() {
      if (isRight) {
        currentName += 1;
        if (currentName >= imageName.length) {
          currentName = 0;
        }
      } else {
        currentName -= 1;
        if (currentName < 0) {
          currentName = imageName.length - 1;
        }
      }
    });
  }
}
