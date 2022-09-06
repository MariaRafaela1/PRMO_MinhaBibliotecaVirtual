import 'package:flutter/material.dart';
import 'package:helloworld/pages/login.dart';

class Sucesso extends StatefulWidget {
  const Sucesso({Key? key}) : super(key: key);

  @override
  State<Sucesso> createState() => _SucessoState();
}

class _SucessoState extends State<Sucesso> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: 200,
                child: Image.asset('assets/images/logo-appMBV.png'),
              
              ),
              Text(
                'Sucesso!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF59382),
                ),
              ),
              Icon(
                Icons.done,
                color: Colors.black,
                size: 150.0,
              ),
              Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(),
                        child: Text(
                          'Login',
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
