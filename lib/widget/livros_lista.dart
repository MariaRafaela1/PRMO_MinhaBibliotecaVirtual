import 'package:flutter/material.dart';
import 'package:helloworld/pages/detalhes.dart';

class LivrosCard extends StatefulWidget {
  final String titulo;
  final String autor;
  final String img;

  const LivrosCard({
    Key? key,
    required this.titulo,
    required this.autor,
    required this.img,
  }) : super(key: key);

  @override
  _LivrosCardState createState() => _LivrosCardState();
}

class _LivrosCardState extends State<LivrosCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        child: ListTile(
            title: Text(
              '${widget.titulo}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('${widget.autor}'),
            leading: SizedBox(
              width: 30.0,
              height: 100.0,
              child: Image.network(
                '${widget.img}',
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const Detalhes();
                }),
              );
            }));
  }
}
