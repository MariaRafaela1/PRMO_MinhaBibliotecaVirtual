import 'package:flutter/material.dart';
import 'package:helloworld/pages/login.dart';
import 'package:helloworld/pages/sucesso.dart';
import 'package:helloworld/data/address_api.dart';
import 'package:helloworld/domain/address.dart';

import '../data/usuario_dao.dart';
import '../domain/usuario.dart';

class CadastrarUser extends StatefulWidget {
  const CadastrarUser({Key? key}) : super(key: key);

  @override
  State<CadastrarUser> createState() => _CadastrarUserState();
}

class _CadastrarUserState extends State<CadastrarUser> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cepController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController bairroController = TextEditingController();

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
              validator: (value) {
                if (value!.isEmpty) {
                  return "Campo obrigatório";
                }

                return null;
              },
              controller: nameController,
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
              validator: (value) {
                if (value!.isEmpty) {
                  return "Campo obrigatório";
                }

                return null;
              },
              controller: emailController,
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
            const SizedBox(height: 30),
            Row(children: [
              const Text(
                'CEP',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ]),
            SizedBox(height: 8),
            TextFormField(
              controller: cepController,
              onEditingComplete: onEditingComplete,
              decoration: const InputDecoration(
                  prefixIcon: const Icon(
                    Icons.markunread_mailbox,
                    color: Colors.black,
                  ),
                  filled: true,
                  fillColor: Color(0xFFFFECE8)),
            ),
            const SizedBox(height: 30),
            Row(children: [
              const Text(
                'Endereço',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ]),
            SizedBox(height: 8),
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(
                  prefixIcon: const Icon(
                    Icons.apartment,
                    color: Colors.black,
                  ),
                  filled: true,
                  fillColor: Color(0xFFFFECE8)),
            ),
            const SizedBox(height: 30),
            Row(children: [
              const Text(
                'Bairro',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ]),
            SizedBox(height: 8),
            TextFormField(
              controller: bairroController,
              decoration: const InputDecoration(
                  prefixIcon: const Icon(
                    Icons.pin_drop,
                    color: Colors.black,
                  ),
                  filled: true,
                  fillColor: Color(0xFFFFECE8)),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: onPressed,
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
      ),
    );
  }

  void onPressed() async {
    if (_formKey.currentState!.validate()) {
      String nomeDigitado = nameController.text;
      String emailDigitado = emailController.text;
      String senhaDigitada = passwordController.text;

      Usuario userCriado = Usuario(
          email: emailDigitado, senha: senhaDigitada, nome: nomeDigitado);
      await UsuarioDao().salvarUsuario(usuario: userCriado);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const Sucesso();
      }));
    } else {
      showSnackBar("Erro na validação");
    }
  }

  showSnackBar(String msg) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(
        vertical: 80,
        horizontal: 32,
      ),
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  Future<void> onEditingComplete() async {
    String cep = cepController.text;
    Address address = await AddressApi().findAddressByCep(cep);

    addressController.text = address.logradouro;
    bairroController.text = address.bairro;
  }
}
