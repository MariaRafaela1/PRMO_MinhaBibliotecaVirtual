import 'package:flutter/material.dart';
import 'package:helloworld/domain/livro.dart';

class Detalhes extends StatefulWidget {
  final Livro livro;

  const Detalhes({
    Key? key,
    required this.livro,
  }) : super(key: key);

  @override
  _DetalhesState createState() => _DetalhesState();
}

class _DetalhesState extends State<Detalhes> {
  Livro get l => widget.livro;

  String dropdownValue = 'Lendo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          l.titulo,
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
                  l.imagem,
                  fit: BoxFit.cover,
                )),
            listaSuspensa(),
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
                      l.autor,
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
                      l.editora,
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
                      'ISBN: ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      l.isbn,
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
          ],
        ),
      ),
    );
  }

  Widget listaSuspensa() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Color(0xFFFABEB3),
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Lendo', 'Lido', 'Parei de ler']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
