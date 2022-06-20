import 'package:flutter/material.dart';
import 'package:helloworld/pages/detalhes.dart';

//ERRO

class LivroHome extends StatefulWidget {
  final String imagem;

  const LivroHome({
    Key? key,
    required this.imagem,
  }) : super(key: key);

  @override
  _LivroHomeState createState() => _LivroHomeState();
}

class _LivroHomeState extends State<LivroHome> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const Detalhes();
            }),
          );
        },
        child: Container(
          height: 110,
          width: 90,
          child: Image.network(widget.imagem),
        ),
      ),
    );
  }
}
