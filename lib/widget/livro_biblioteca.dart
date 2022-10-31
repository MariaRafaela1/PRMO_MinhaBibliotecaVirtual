import 'package:flutter/material.dart';
import 'package:helloworld/pages/detalhes.dart';
import 'package:helloworld/domain/livro.dart';

class LivroBiblioteca extends StatefulWidget {
  final Livro livro;

  const LivroBiblioteca({
    Key? key,
    required this.livro,
  }) : super(key: key);

  @override
  _LivroBibliotecaState createState() => _LivroBibliotecaState();
}

class _LivroBibliotecaState extends State<LivroBiblioteca> {
  Livro get l => widget.livro;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Container(
          height: 100,
          width: 80,
          child: Image.network(l.imagem),
        ),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Detalhes(livro: l);
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
            primary: Color(0xFFFFDAB9),
          ),
        ),
      ]),
    );
  }
}
