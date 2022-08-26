import 'package:flutter/material.dart';
import 'package:listview_ex_app/nation_item.dart';

class SecondPage extends StatefulWidget {
  final List<Nation> list;
  const SecondPage({Key? key,required this.list}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  late TextEditingController nameController;
  final nameController1 = TextEditingController();
  var _imagePath;
  String nationName = "";

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: "");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: '문제를 입력하세요'),
              keyboardType: TextInputType.text,
              readOnly: true,
            ),
            TextField(
              controller: nameController1,
              decoration: const InputDecoration(labelText: '정답을 입력하세요'),
              keyboardType: TextInputType.text,
            ),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      _imagePath = 'images/korea.png';
                      setState(() {
                        nationName = "Korea";    
                      });   
                    },
                    child: Image.asset(
                      'images/korea.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = 'images/china.png';
                      setState(() {
                        nationName = "China";    
                      });   
                    },
                    child: Image.asset(
                      'images/china.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = 'images/usa.png';
                      setState(() {
                        nationName = "USA";    
                      });   
                    },
                    child: Image.asset(
                      'images/usa.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = 'images/greece.png';
                      setState(() {
                        nationName = "Greece";    
                      });   
                    },
                    child: Image.asset(
                      'images/greece.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = 'images/turkey.png';
                      setState(() {
                        nationName = "Turkey";    
                      });   
                    },
                    child: Image.asset(
                      'images/turkey.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = 'images/spain.png';
                      setState(() {
                        nationName = "Spain";    
                      });   
                    },
                    child: Image.asset(
                      'images/spain.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = 'images/chile.png';
                      setState(() {
                        nationName = "Chile";    
                      });   
                    },
                    child: Image.asset(
                      'images/chile.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = 'images/austraila.png';
                      setState(() {
                        nationName = "Austraila";    
                      });   
                    },
                    child: Image.asset(
                      'images/austraila.png',
                      width: 80,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              nationName
            ),
            ElevatedButton(
              onPressed: () {
                var nation = Nation(
                  imagePath: _imagePath, 
                  nationName: nameController1.text,
                  );
                  AlertDialog dialog =AlertDialog(
                    title: const Text('문제 추가하기'),
                    content: Text(
                      '이 국기의 문제는 ${nation.nationName[0]}${"__"*(nation.nationName.length-1)} 입니다.'
                      '또 이 문제의 정답은 $nationName 입니다. \n'
                      '이 문제를 추가하시겠습니까?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          widget.list.add(nation);
                          Navigator.of(context).pop();
                        }, 
                        child: const Text('예')
                        ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        }, 
                        child: const Text('아니오')
                        ),
                    ],
                  );
                showDialog(
                  context: context, 
                  builder: (BuildContext context){
                    return dialog;
                  }
                  );
              }, 
              child: const Text("문제 추가하기"),
              ),
          ],
        ),
      ),
    );
  }
}