import 'package:flutter/material.dart';

class Adicionar extends StatefulWidget {
  const Adicionar({Key? key}) : super(key: key);

  @override
  State<Adicionar> createState() => _AdicionarState();
}

class _AdicionarState extends State<Adicionar> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Adicionar livro na lista de desejos',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
