import 'package:flutter/material.dart';
import 'package:listview_app/animal_item.dart';

class FirstPage extends StatefulWidget {
  final List<Animal> list;
  const FirstPage({Key? key,required this.list}) : super(key: key);

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
          itemBuilder: (context,position){
            return GestureDetector(
              onTap: () => _showDialog(context, 
                        widget.list[position].animalName,
                        widget.list[position].kind),
              child: Card(
                child: Row(
                  children: [
                    Image.asset(
                      widget.list[position].imagePath,
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                    Text("      ${widget.list[position].animalName}")
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Functions
  _showDialog(BuildContext context, String animalName,String kind){
    showDialog(
      context: context, 
      builder: (BuildContext ctx){
        return AlertDialog(
          title: Text(animalName),
          content: Text("이 동물은 $kind 입니다."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              }, 
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue)
              ),
              child: const Text(
                '종료',
                style: TextStyle(
                  color: Colors.white,
                ),
                ),
              ),
          ],
        );
      }
      );
  }
}