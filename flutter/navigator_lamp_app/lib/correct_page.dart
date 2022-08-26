import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/message.dart';

class CorrectPage extends StatefulWidget {
  const CorrectPage({Key? key}) : super(key: key);

  @override
  State<CorrectPage> createState() => _CorrectPageState();
}

class _CorrectPageState extends State<CorrectPage> {

  final controller = TextEditingController(text: Message.controller.text);

  late bool switchValue;
  late String switchName;

  List status = [];
  @override
  void initState() {
    if(Message.lampStatus){
      switchName = "On";
      switchValue = true;
    }else{
      switchName = "Off";
      switchValue = false;
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수정화면'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: Message.controller,
                keyboardType: TextInputType.text,
                
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    switchName,
                    ),
                  Switch(
                    value: switchValue, 
                    onChanged: (value){
                      setState(() {
                        switchValue = value;
                        if(value){
                          switchName = "On";
                        }else{
                          switchName = "Off";
                        }
                      });
                    }
                    ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Message.lampStatus = switchValue;
                  Navigator.of(context).pop();
                }, 
                child: const Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}