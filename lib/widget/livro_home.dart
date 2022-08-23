import 'package:flutter/material.dart';
import 'package:helloworld/pages/detalhes.dart';
import 'package:helloworld/domain/livro.dart';

class LivroHome extends StatefulWidget {
  final Livro livro;

  const LivroHome({
    Key? key,
    required this.livro,
  }) : super(key: key);

  @override
  _LivroHomeState createState() => _LivroHomeState();
}

class _LivroHomeState extends State<LivroHome> {
  Livro get l => widget.livro;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return Detalhes(livro: l);
            }),
          );
        },
        child: Container(
          height: 110,
          width: 90,
          child: Image.network(l.imagem),
        ),
      ),
    );
  }
}
