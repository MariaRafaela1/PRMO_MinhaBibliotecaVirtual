import 'package:flutter/material.dart';
import 'package:helloworld/widget/livro_biblioteca.dart';
import 'package:helloworld/domain/livro.dart';
import 'package:helloworld/data/BD.dart';
import 'package:helloworld/pages/cadastrar_livro.dart';

class Biblioteca extends StatefulWidget {
  const Biblioteca({Key? key}) : super(key: key);

  @override
  State<Biblioteca> createState() => _BibliotecaState();
}

class _BibliotecaState extends State<Biblioteca> {
  List<Livro> lista = BD.listaLivros;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFFABEB3),
        title: Text(
          'Minha Biblioteca',
          style: TextStyle(color: Color(0xFF000000)),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0), child: buildListView(context)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return CadastrarLivro();
            },
          ));
        },
        backgroundColor: Color(0xFFFABEB3),
        child: const Icon(
          Icons.import_contacts,
          color: Colors.black,
        ),
      ),
    );
  }

  buildListView(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 0.75),
      itemCount: lista.length,
      itemBuilder: (context, index) {
        return LivroBiblioteca(
          livro: lista[index],
        );
      },
    );
  }
}
