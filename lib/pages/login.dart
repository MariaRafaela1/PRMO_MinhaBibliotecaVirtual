import 'package:flutter/material.dart';
import 'package:helloworld/pages/barra_inferior.dart';
import 'package:helloworld/pages/cadastrar_usuario.dart';

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
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 250,
            width: 250,
            child: Image.asset('assets/images/logo-appMBV.png'),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.email,
                color: Colors.black,
              ),
              filled: true,
              fillColor: Color(0xFFFFECE8),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 8),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
          SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.lock_outline,
                color: Colors.black,
              ),
              filled: true,
              fillColor: Color(0xFFFFECE8),
            ),
            keyboardType: TextInputType.text,
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
              primary: Color(0xFFFABEB3),
            ),
          ),
          Expanded(
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Não tem conta?',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(),
                    child: Text(
                      'Criar',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFF59382),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const CadastrarUser();
                      }));
                    },
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}
