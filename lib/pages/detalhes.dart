import 'package:flutter/material.dart';

class Detalhes extends StatefulWidget {
  const Detalhes({Key? key}) : super(key: key);

  @override
  _DetalhesState createState() => _DetalhesState();
}

class _DetalhesState extends State<Detalhes> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Detalhes do livro',
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}
