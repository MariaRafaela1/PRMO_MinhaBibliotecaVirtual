import 'package:flutter/material.dart';
import 'package:helloworld/widget/livros_lista.dart';
import 'package:helloworld/pages/adicionar_livro.dart';
import 'package:helloworld/domain/livro.dart';
import 'package:helloworld/data/BD.dart';
import '../data/livro_dao.dart';

class ListaDesejos extends StatefulWidget {
  const ListaDesejos({Key? key}) : super(key: key);

  @override
  State<ListaDesejos> createState() => _ListaDesejosState();
}

class _ListaDesejosState extends State<ListaDesejos> {
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
        child: buildListView(),
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

  buildListView() {
    Future<List<Livro>> futureLista = LivroDao().listarlivros();

    return FutureBuilder<List<Livro>>(
        future: futureLista,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Livro> lista = snapshot.data ?? [];

            return ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, index) {
                return LivrosCard(
                  livro: lista[index],
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
