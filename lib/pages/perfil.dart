import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Column(children: [
                const Icon(
                  Icons.account_circle,
                  color: Colors.black,
                  size: 150.0,
                ),
                const Text(
                  'email@exemplo',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                const Text(
                  'Nome Exemplo',
                  style: TextStyle(
                    color: Color(0xFFF59382),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
            const SizedBox(height: 16),
            Row(children: [
              const Icon(
                Icons.manage_accounts,
                color: Colors.black,
                size: 50.0,
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
                const Icon(
                  Icons.logout,
                  color: Colors.black,
                  size: 50.0,
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
          ],
        ),
      ),
    );
  }
}
