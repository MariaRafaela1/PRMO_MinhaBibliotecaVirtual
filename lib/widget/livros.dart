import 'package:flutter/material.dart';
import 'package:helloworld/pages/detalhes.dart';

class Livro extends StatefulWidget {
  final String imagem;

  const Livro({
    Key? key,
    required this.imagem,
  }) : super(key: key);

  @override
  _LivroState createState() => _LivroState();
}

class _LivroState extends State<Livro> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Container(
          height: 100,
          width: 80,
          child: Image.network(widget.imagem),
        ),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Detalhes();
            }));
          },
          child: const Text(
            'Detalhes',
            style: TextStyle(
              fontSize: 10,
              color: Colors.black,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Color(0xFFFFE7B2),
          ),
        ),
      ]),
    );
  }
}
