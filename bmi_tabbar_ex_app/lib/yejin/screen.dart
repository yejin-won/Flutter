import 'package:flutter/material.dart';

import 'messge.dart';
import 'screen1.dart';
import 'screen2.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  // property
  late TextEditingController numHeight;
  late TextEditingController numWeight;
  late double bmi;
  late String result;

  @override
  void initState() {
    numHeight = TextEditingController();
    numWeight = TextEditingController();
    bmi = 0.0;
    result = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BMI 계산기'),
          backgroundColor: Colors.amberAccent,
          foregroundColor: Colors.black,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: numHeight,
                  decoration: const InputDecoration(labelText: '키(cm) 입력',
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                    color: Colors.amberAccent,
                  ),),),
                  keyboardType: TextInputType.number,

                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: numWeight,
                  decoration: const InputDecoration(labelText: '몸무게(kg) 입력',
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                    color: Colors.amberAccent,
                  ),),),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (numHeight.text.trim().isEmpty &&
                          numWeight.text.trim().isEmpty) {
                        errorSnackbar();
                      } else {
                        Message.numHeight = numHeight.text;
                        Message.numWeight = numWeight.text;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Screen1(),
                          ),
                        );
                        bmiCalc();
                      }
                      ;
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.orangeAccent),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calculate_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'BMI 계산하기',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/JJanggu01.png'),
                ),
                accountName: const Text('JJang-Gu'),
                accountEmail: const Text('jjang@naver.com'),
                decoration: BoxDecoration(
                  color: Colors.yellow[900],
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context, 
                        MaterialPageRoute(
                          builder: (context) => const Screen2(),
                          ),);
                      },
                      child: const Text(
                        'BMI란?',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Functions
  errorSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('숫자를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red[400],
      ),
    );
  }

  bmiCalc() {
    bmi = int.parse(numWeight.text) / 
        ((int.parse(numHeight.text)/100)*(int.parse(numHeight.text)/100));
    result = bmi.toStringAsFixed(2);
    if(bmi>=0&&bmi<=18.4){
      result+= "로 \n저체중입니다.";
    }else if(bmi>=18.5&&bmi<=22.9){
      result+= "로 \n정상체중입니다.";
    }else if(bmi>=23&&bmi<=24.9){
      result+= "로 \n과체중입니다.";
    }else if(bmi>=25&&bmi<=29.9){
      result+= "로 \n비만입니다.";
    }else{
       result+= "로\n고도비만입니다.";
    }

    Message.bmi = bmi;
    Message.result = result;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Screen1(),
      ),
    );
  }
}
