import 'package:flutter/material.dart';
import 'package:helloworld/domain/livro.dart';
import 'package:helloworld/pages/resultados.dart';

import '../data/bookapi.dart';
import 'package:helloworld/domain/livro_api.dart';

class Detalhes extends StatefulWidget {
  final LivroGoogle livro;

  const Detalhes({
    Key? key,
    required this.livro,
  }) : super(key: key);

  @override
  _DetalhesState createState() => _DetalhesState();
}

class _DetalhesState extends State<Detalhes> {
  LivroGoogle get l => widget.livro;

  String dropdownValue = 'Lendo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${l.titulo}',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xFFFABEB3),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
                height: 200,
                width: 150,
                child: Image.network(
                  '${l.imagem}',
                  fit: BoxFit.cover,
                )),
            Card(
              elevation: 0,
              child: Container(
                margin: const EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Autor(a): ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '${l.autor}',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 0,
              child: Container(
                margin: const EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Editora: ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '${l.editora}',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 0,
              child: Container(
                margin: const EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Páginas: ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      l.numPaginas.toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 2,
              child: Container(
                margin: const EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    
                    Expanded(
                      child: Text(
                        '${l.sinopse}',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        softWrap: false,
                        maxLines: 100,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: onPressed,
              child: const Text(
                'Ver mais livros do autor',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFFABEB3),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onPressed() async {
    List<LivroGoogle> books = await LivroApi().buscarLivrosAutor('${l.autor}');
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Resultados(lista: books);
    }));
  }
}
