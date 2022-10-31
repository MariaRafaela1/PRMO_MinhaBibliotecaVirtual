import 'package:flutter/material.dart';
import 'package:helloworld/pages/login.dart';
import 'package:helloworld/pages/configurar_perfil.dart';
import 'package:helloworld/domain/usuario.dart';

import '../data/usuario_dao.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFFABEB3),
        title: Text(
          'Página de perfil',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0), child: buildFutureBuilder()),
    );
  }

  buildFutureBuilder() {
    Future<List<Usuario>> futureLista = UsuarioDao().listarusuarios();

    return FutureBuilder<List<Usuario>>(
      future: futureLista,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Usuario> lista = snapshot.data ?? [];

          return buildColumn(lista, context);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

buildColumn(List<Usuario> lista, context) {
  return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.account_circle,
            color: Colors.black,
            size: 150.0,
          ),
          Text(
            lista[0].email,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          Text(
            lista[0].nome,
            style: TextStyle(
              color: Color(0xFFF59382),
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
    const SizedBox(height: 16),
    Row(children: [
      IconButton(
        icon: Icon(
          Icons.manage_accounts,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ConfigurarPerfil();
              },
            ),
          );
        },
      ),
      const SizedBox(width: 8),
      const Text(
        'Editar perfil',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    ]),
    const SizedBox(height: 16),
    Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.logout,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return Login();
              },
            ));
          },
        ),
        const SizedBox(width: 8),
        const Text(
          'Sair',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ]);
}
