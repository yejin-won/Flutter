import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_sol1_app/controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String _lampImage;
  late bool lampStatus;
  late bool lampColor;

  @override
  void initState() {
    _lampImage = "images/lamp_on.png";
    lampStatus = true;
    lampColor = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                            return Controller(lampColor: lampColor,lampStatus: lampStatus);
                          }),
                          ).then((value) => getData(value));
            },
            icon: const Icon(Icons.edit),
          )
        ],
      ),
      body: Center(
        child: Image.asset(
          _lampImage,
          width: 150,
          height: 300,
        ),
      ),
    );
  }

  // functions
  getData(value) {
    print("Controller : ${value[0]},${value[1]}"); // value[0] : lampColor , value[1] : lampStatus
    setState(() {
      if (value[0]) {
        if (value[1]) {
          _lampImage = 'images/lamp_on.png';
          lampColor = true; 
        } else {
          _lampImage = 'images/lamp_red.png';
          lampColor = false;
        }
        lampStatus = true;
      } else {
        _lampImage = 'images/lamp_off.png';
        lampStatus = false;
        if(value[1]){
          lampColor = true;
        }else{
          lampColor = false;
        }
      }
    });
  }
}
