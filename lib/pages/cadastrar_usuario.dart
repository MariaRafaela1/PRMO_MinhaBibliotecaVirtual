import 'package:flutter/material.dart';
import 'package:helloworld/pages/login.dart';
import 'package:helloworld/pages/sucesso.dart';

class CadastrarUser extends StatefulWidget {
  const CadastrarUser({Key? key}) : super(key: key);

  @override
  State<CadastrarUser> createState() => _CadastrarUserState();
}

class _CadastrarUserState extends State<CadastrarUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 200,
            width: 200,
            child: Image.asset('assets/images/logo-appMBV.png'),
          ),
          Text(
            'Crie sua conta',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF59382),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(width: 16),
            const Text(
              'Nome',
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
                Icons.person,
                color: Colors.black,
              ),
              filled: true,
              fillColor: Color(0xFFFFECE8),
            ),
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 8),
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
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return const Sucesso();
              }));
            },
            child: const Text(
              'Criar',
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
                    'Já tem uma conta?',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(),
                    child: Text(
                      'Acessar',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFF59382),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return const Login();
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
