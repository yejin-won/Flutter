import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {

  late TextEditingController idController;
  late TextEditingController nickController;
  late TextEditingController pwController;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    nickController = TextEditingController();
    pwController = TextEditingController();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in temp screen'),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign-In',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // const Text('ID : '),       // error 발생으로 Row로 못함  
              TextField(
                controller: idController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Input ID',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // const Text('Nickname : '),
              TextField(
                controller: nickController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Input Nickname',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // const Text('PW : '),
              TextField(
                controller: pwController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Input Password',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  _signIn();
                  Navigator.pushNamed(context, '/');
                }, 
                child: const Text('Sign in')
                ),
            ],
          ),
        ),
      ),
    );
  }
  // functions
  _signIn(){

  }

}