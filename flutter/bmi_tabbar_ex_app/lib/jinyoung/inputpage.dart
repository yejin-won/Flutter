import 'package:bmi_tabbar_ex_app/jinyoung/message.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Property
  late TextEditingController height;
  late TextEditingController weight;
  late bool switchMale;
  late bool switchFemale;
  late double bmi; 
  late String bmiName; 
  late String imageName; 

  @override
  void initState() {
    height = TextEditingController();
    weight = TextEditingController();
    switchFemale = false;
    switchMale = false;
    bmi = 0; 
    bmiName = "";
    imageName = ""; 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("키 & 몸무게 입력"),
        backgroundColor: Colors.green[800],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: height,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "키(cm)를 입력하세요",
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 3, color: Colors.lightGreen),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.red),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: weight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "몸무게(kg)를 입력하세요",
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 3, color: Colors.lightGreen),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.red),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    showResult(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green[800]),
                  ),
                  child: const Text("결과보기"))
            ],
          ),
        ),
      ),
    );
  }

  // --- Functions

  // Desc : 결과 보여주기 버튼 클릭시 실행 함수
  showResult(BuildContext context) {
    if (height.text.trim().isEmpty || weight.text.trim().isEmpty) {
      errorSnackBar(context);
    } else {
      Message.height = height.text;
      Message.weight = weight.text;
      showAlert(context);
      calcBmi();
    }
  }

  showAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text("결과보기"),
            content: const Text("마음의 준비가 되셨나요?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  Navigator.pushNamed(context, '/result');
                },
                child: const Text("네!"),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                    Navigator.pushNamed(context, '/input');
                  },
                  child: const Text("아뇨,다음에 볼게요.")),
            ],
          );
  });
  }

// Desc: 숫자 입력 하지 않을 경우 스낵바 함수
  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("모든 필드에 숫자를 반드시 입력하세요!"),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

// Desc: BMI 계산 
calcBmi(){
  bmi = int.parse(weight.text) / ((int.parse(height.text)/ 100)*(int.parse(height.text)/ 100));
  if(bmi >= 30) {
    Message.bmiName = "고도비만"; 
    Message.imageName = "images/extremeobese.png";
  }else if(bmi >= 25){
    Message.bmiName = "비만"; 
  Message.imageName = "images/obese.png";
  }else if(bmi >= 23) {
    Message.bmiName = "과체중";
    Message.imageName = "images/overweight.png";
  }else if(bmi >= 18.5) {
    Message.bmiName = "정상체중"; 
    Message.imageName = "images/normal.png";
  }else {
    Message.bmiName = "저체중"; 
    Message.imageName = "images/underweight.png";
  }
}



} // End
