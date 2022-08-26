import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI 계산기"),
        backgroundColor: Colors.green[800],
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/input');
            },
            icon: const Icon(Icons.monitor_weight_outlined),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/zzangu.png'),
              ),
              accountName: Text('몸짱구'),
              accountEmail: Text('momzzang@gmail.com'),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35)),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/input');
              },
              leading: const Icon(
                Icons.monitor_weight_outlined,
                color: Colors.red,
              ),
              title: const Text('BMI 계산하기'),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 90,
          ),
          Image.asset('images/bmi.jpg'),
          const Text("당신의 BMI 지수는?",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),),
        ],
      ),
    );
  }
}
