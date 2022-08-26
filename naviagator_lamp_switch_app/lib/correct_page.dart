import 'package:flutter/material.dart';
import 'package:naviagator_lamp_switch_app/message.dart';

class CorrectPage extends StatefulWidget {
  const CorrectPage({Key? key}) : super(key: key);

  @override
  State<CorrectPage> createState() => _CorrectPageState();
}

class _CorrectPageState extends State<CorrectPage> {
  // property
  String statusName = "Red";
  String statusName1 = "Off";
  late bool _switch;
  late bool _switch1;

  @override
  void initState() {
    _switch = false;
    _switch1 = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수정화면'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(statusName),
                Switch(
                    value: _switch,
                    onChanged: (value) {
                      setState(() {
                        _switch = value;
                        if (_switch == true) {
                          statusName = "Yellow";
                        } else {
                          statusName = "Red";
                        }
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(statusName1),
                Switch(
                    value: _switch1,
                    onChanged: (value) {
                      setState(() {
                        _switch1 = value;
                        if (_switch1 == true) {
                          statusName1 = "On";
                        } else {
                          statusName1 = "Off";
                        }
                      });
                    }),
              ],
            ),
            ElevatedButton(
                onPressed: (() {
                  changeLampColor();
                }),
                child: const Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
          ],
        ),
      ),
    );
  }

  changeLampColor() {
    if (_switch == true) {
      if (_switch1 == true) {
        Message.imageName = "images/lamp_on.png";
      } else {
        if (_switch1 == false) {
          Message.imageName = "images/lamp_off.png";
        }
      }
    } else {
      if (_switch1 == true) {
        Message.imageName = "images/lamp_red.png";
      } else {
        Message.imageName = "images/lamp_off.png";
      }
    }
  }
}
