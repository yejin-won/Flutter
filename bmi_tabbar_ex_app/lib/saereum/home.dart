import 'package:bmi_tabbar_ex_app/saereum/message.dart';
import 'package:flutter/material.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => MainState();
}

class MainState extends State<Main> {
  late TextEditingController height;
  late TextEditingController weight;

  @override
  void initState() {
    height = TextEditingController();
    weight = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('BMI(체질량지수) 검사'),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'BMI 검사하기',
                  style: TextStyle(fontSize: 50, color: Colors.black54),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: height,
                  decoration: const InputDecoration(
                      labelText: '키(cm)를 입력하여주세요.',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber))),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: weight,
                  decoration: const InputDecoration(
                      labelText: '몸무게(kg)를 입력하여주세요.',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber))),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.black26),
                        onPressed: () {
                          height.text = '';
                          weight.text = '';
                        },
                        child: const Text('재입력')),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.amber),
                        onPressed: () {
                          if (height.text.isEmpty | weight.text.isEmpty) {
                            errorSnackbar(context);
                          } else {
                            Message.heigth = height.text.trim();
                            Message.weigth = weight.text.trim();
                            Navigator.pushNamed(context, 'result');
                          }
                        },
                        child: const Text('입력')),
                  ],
                ),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/nadu1.gif'),
                ),
                otherAccountsPictures: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/nadu2.gif'),
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('images/nadu.jpg'),
                  ),
                ],
                accountName: Text('살빼고싶어?'),
                accountEmail: Text('야 너두 할수 있어'),
                decoration: BoxDecoration(color: Colors.blueGrey),
              ),
              ListTile(
                onTap: () => Navigator.pushNamed(context, 'report'),
                leading: const Icon(Icons.text_snippet),
                title: const Text('지난 기록 확인하기'),
              ),
              ListTile(
                onTap: () => Navigator.pushNamed(context, 'exec'),
                leading: const Icon(Icons.run_circle),
                title: const Text('쉽게 살빼기'),
              ),
              ListTile(
                onTap: () => Navigator.pushNamed(context, 'exec2'),
                leading: const Icon(Icons.fitness_center),
                title: const Text('운동법 확인하기'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  errorSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('키와 몸무게를 입력하여주세요.'),
      backgroundColor: Colors.red,
    ));
  }
}
