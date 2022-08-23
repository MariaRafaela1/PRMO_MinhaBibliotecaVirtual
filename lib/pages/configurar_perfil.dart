import 'package:flutter/material.dart';
import 'package:helloworld/pages/barra_inferior.dart';

class ConfigurarPerfil extends StatefulWidget {
  const ConfigurarPerfil({Key? key}) : super(key: key);

  @override
  State<ConfigurarPerfil> createState() => _ConfigurarPerfilState();
}

class _ConfigurarPerfilState extends State<ConfigurarPerfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFFFABEB3),
          title: Text(
            'Configurar perfil',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Icon(
                    Icons.account_circle,
                    color: Colors.black,
                    size: 150.0,
                  ),
                  const Text(
                    'Alterar foto do perfil',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(children: [
                    const Text(
                      'Alterar e-mail',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    )
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
                  const SizedBox(height: 16),
                  Row(children: [
                    const Text(
                      'Alterar nome',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    )
                  ]),
                  SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                      filled: true,
                      fillColor: Color(0xFFFFECE8),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(children: [
                    const Text(
                      'Alterar senha',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    )
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
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const BarraInferior();
                      }));
                    },
                    child: const Text(
                      'Salvar',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFABEB3),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
