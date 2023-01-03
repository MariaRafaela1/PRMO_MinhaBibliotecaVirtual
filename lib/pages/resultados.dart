import 'package:flutter/material.dart';
import 'package:helloworld/domain/livro_api.dart';
import 'package:helloworld/data/bookapi.dart';
import 'package:helloworld/pages/detalhes_livro_api.dart';

class Resultados extends StatefulWidget {
  final List<LivroGoogle> lista;

  const Resultados({
    Key? key,
    required this.lista,
  }) : super(key: key);

  @override
  _ResultadosState createState() => _ResultadosState();
}

class _ResultadosState extends State<Resultados> {
  List<LivroGoogle> get l => widget.lista;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Resultado da pesquisa',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xFFFABEB3),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: buildListView(context),
      ),
    );
  }

  buildListView(BuildContext context) {
    return ListView.builder(
      itemCount: l.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          child: ListTile(
            title: Text(
              '${l[index].titulo}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('${l[index].autor}'),
            leading: SizedBox(
              width: 30.0,
              height: 100.0,
              child: Image.network(
                '${l[index].imagem}',
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Detalhes(livro: l[index]),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
