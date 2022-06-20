import 'package:flutter/material.dart';
import 'package:helloworld/widget/livros_lista.dart';
import 'package:helloworld/pages/adicionar_livro.dart';

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
        child: ListView(children: [
          const SizedBox(height: 16),
          const LivrosCard(
            titulo: 'Harry Potter e a Pedra Filosofal',
            autor: 'J.K. Rowling',
            img: 'https://images-na.ssl-images-amazon.com/images/I/81ibfYk4qmL.jpg',
          ),
          const LivrosCard(
            titulo: 'Orgulho e Preconceito',
            autor: 'Jane Austen',
            img: 'https://images-na.ssl-images-amazon.com/images/I/71fj3qrLmFL.jpg',
          ),
          const LivrosCard(
            titulo: 'Jane Eyre',
            autor: 'Charlotte Brontë',
            img: 'https://m.media-amazon.com/images/I/41Y3qhgAsJL.jpg',
          ),
          const LivrosCard(
            titulo: 'It: A coisa',
            autor: 'Stephen King',
            img: 'https://lojasaraiva.vteximg.com.br/arquivos/ids/12104715/1008975660.jpg?v=637142231219470000',
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const Adicionar();
            },
          ));
        },
        backgroundColor: Color(0xFFFABEB3),
      ),
    );
  }
}
