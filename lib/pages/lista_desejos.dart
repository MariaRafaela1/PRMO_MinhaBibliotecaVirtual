import 'package:flutter/material.dart';
import 'package:helloworld/widget/livros_lista.dart';
import 'package:helloworld/pages/adicionar_livro.dart';
import 'package:helloworld/domain/livro.dart';
import 'package:helloworld/data/BD.dart';

class ListaDesejos extends StatefulWidget {
  const ListaDesejos({Key? key}) : super(key: key);

  @override
  State<ListaDesejos> createState() => _ListaDesejosState();
}

class _ListaDesejosState extends State<ListaDesejos> {
  List<Livro> lista = BD.listaLivros;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de desejos',
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
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return Adicionar();
            },
          ));
        },
        backgroundColor: Color(0xFFFABEB3),
      ),
    );
  }

  buildListView(BuildContext context) {
    return ListView.builder(
      itemCount: lista.length,
      itemBuilder: (context, index) {
        return LivrosCard(
          livro: lista[index],
        );
      },
    );
  }
}
