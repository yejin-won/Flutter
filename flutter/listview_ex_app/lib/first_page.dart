import 'package:flutter/material.dart';
import 'package:listview_ex_app/nation_item.dart';

class FirstPage extends StatefulWidget {
  final List<Nation> list;
  const FirstPage({Key? key, required this.list}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: widget.list.length,
            itemBuilder: (context, position) {
              return GestureDetector(
                onTap: () => _showDialog(context,
                widget.list[position].nationName),
                child: Card(
                  child: Row(
                    children: [
                      Image.asset(
                        widget.list[position].imagePath,
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                      Text(
                          "   ${widget.list[position].nationName[0]}${"__" * (widget.list[position].nationName.length - 1)}"),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  // functions
  _showDialog(BuildContext context,String nationName){
    showDialog(
      context: context, 
      builder: (BuildContext ctx){
        return AlertDialog(
          title: const Text("국가명"),
          content:  Text("이 국가는 $nationName 입니다."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              }, 
              child: const Text('종료')
              ),
          ],
        );
      }
      );
  }
}
