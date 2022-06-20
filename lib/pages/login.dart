import 'package:flutter/material.dart';
import 'package:helloworld/pages/barra_inferior.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Container(
            height: 250,
            width: 250,
            child: Image.network('https://i.postimg.cc/nrhzMjDb/logo-app-MBV.png'),
          ),
          Row(children: [
            SizedBox(width: 16),
            const Text(
              'E-mail',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ]),
          SizedBox(height: 8),
          Container(
            color: Color(0xFFFABEB3),
            height: 40,
          ),
          SizedBox(height: 8),
          Row(children: [
            SizedBox(width: 16),
            const Text(
              'Senha',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ]),
          Container(
            color: Color(0xFFFABEB3),
            height: 40,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const BarraInferior();
              }));
            },
            child: const Text(
              'Entrar',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFFFE7B2),
            ),
          ),
        ]),
      ),
    );
  }
}
