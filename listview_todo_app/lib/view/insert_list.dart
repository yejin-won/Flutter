import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({Key? key}) : super(key: key);

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  late TextEditingController textEditingController;
  late bool _switch;
  late bool _switch1;
  late bool _switch2;

  @override
  void initState() {
    textEditingController = TextEditingController();

    _switch = true;
    _switch1 = false;
    _switch2 = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('구매'),
                  Switch(
                    value: _switch,
                    onChanged: (value) {
                      setState(() {
                        _switch = value;
                        if (_switch == true) {
                          _switch1 = false;
                          _switch2 = false;
                        }
                        if (_switch == false &&
                            _switch1 == false &&
                            _switch2 == false) _switch = true;
                      });
                    },
                  ),
                  Image.asset(
                    'images/cart.png',
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('약속'),
                  Switch(
                    value: _switch1,
                    onChanged: (value) {
                      setState(() {
                        _switch1 = value;
                        if (_switch1 == true) {
                          _switch = false;
                          _switch2 = false;
                        }
                        if (_switch == false &&
                            _switch1 == false &&
                            _switch2 == false) _switch = true;
                      });
                    },
                  ),
                  Image.asset(
                    'images/clock.png',
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('스터디'),
                  Switch(
                    value: _switch2,
                    onChanged: (value) {
                      setState(() {
                        _switch2 = value;
                        if (_switch2 == true) {
                          _switch1 = false;
                          _switch = false;
                        }
                        if (_switch == false &&
                            _switch1 == false &&
                            _switch2 == false) _switch = true;
                      });
                    },
                  ),
                  Image.asset(
                    'images/pencil.png',
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
              TextField(
                controller: textEditingController,
                decoration: const InputDecoration(labelText: '목록을 입력하세요'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  if (textEditingController.text.trim().isNotEmpty) {
                    addList();
                  }
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Funtions

  addList() {
    if (_switch == true) {
      Message.imagePath = 'images/cart.png';
    }
    else if (_switch1 == true) {
      Message.imagePath = 'images/clock.png';
    }
    else if (_switch2 == true) {
      Message.imagePath = 'images/pencil.png';
    }
    Message.workList = textEditingController.text;
    Message.action = true; // 해당 data는 생긴상태라 명시
  }
}
