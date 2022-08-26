import 'package:flutter/material.dart';

class SendMail extends StatelessWidget {
  const SendMail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SendMail'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(2, 50, 300, 10),
          child: Column(
            children: const[
              Text('유비에게 보낸 메일'),
              Text('관우에게 보낸 메일'),
              Text('장비에게 보낸 메일'),
            ],
          ),
        ),
      ),
    ); 
  }
}