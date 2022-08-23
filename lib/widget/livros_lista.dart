import 'package:flutter/material.dart';
import 'package:helloworld/pages/detalhes.dart';
import 'package:helloworld/domain/livro.dart';

class LivrosCard extends StatefulWidget {
  final Livro livro;

  const LivrosCard({
    Key? key,
    required this.livro,
  }) : super(key: key);

  @override
  _LivrosCardState createState() => _LivrosCardState();
}

class _LivrosCardState extends State<LivrosCard> {
  Livro get l => widget.livro;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        title: Text(
          l.titulo,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(l.autor),
        leading: SizedBox(
          width: 30.0,
          height: 100.0,
          child: Image.network(l.imagem),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Detalhes(livro: l),
            ),
          );
        },
      ),
    );
  }
}
