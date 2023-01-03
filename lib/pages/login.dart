import 'package:flutter/material.dart';
import 'package:helloworld/pages/barra_inferior.dart';
import 'package:helloworld/pages/cadastrar_usuario.dart';

import '../data/usuario_dao.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: buildBody(),
    );
  }

  buildBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(children: [
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
              validator: (value) {
                if (value!.isEmpty) {
                  return "Campo obrigatório";
                }

                return null;
              },
              controller: userController,
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
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Campo obrigatório";
                } else if (value.length < 6) {
                  return "A senha precisa ter no minimo 6 digitos";
                }

                return null;
              },
              controller: passwordController,
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
              onPressed: onPressed,
              child: const Text(
                'Entrar',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFFFDAB9),
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
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const CadastrarUser();
                        }));
                      },
                    ),
                  ]),
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> onPressed() async {
    if (_formKey.currentState!.validate()) {
      String user = userController.text;
      String pwd = passwordController.text;

      bool resultado = await UsuarioDao().autenticar(usuario: user, senha: pwd);

      if (resultado) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const BarraInferior();
            },
          ),
        );
      } else {
        final msg = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            ("Usuario/Senha incorretos"),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(msg);
      }
    } else {
      print("Formulário invalido");
    }
  }
}
