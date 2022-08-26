import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final idController = TextEditingController();
  final pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login temp_screen'),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.brown[200],
                radius: 50,
                child: const Icon(Icons.free_breakfast,size: 50,),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: idController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Input ID(Email)'
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: pwController,
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Input PassWord'
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  _logIn();
                }, 
                child: const Text('Log in')
                ),
              TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/signin');
                }, 
                child: const Text('Sign in'),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // functions
  _logIn(){

  }

}
