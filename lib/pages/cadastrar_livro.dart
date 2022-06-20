import 'package:flutter/material.dart';

class CadastrarLivro extends StatefulWidget {
  const CadastrarLivro({Key? key}) : super(key: key);

  @override
  State<CadastrarLivro> createState() => _CadastrarLivroState();
}

class _CadastrarLivroState extends State<CadastrarLivro> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Cadastrar livro na biblioteca',
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}
