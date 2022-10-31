import 'package:flutter/material.dart';
import 'package:helloworld/pages/cadastrar_livro.dart';
import 'package:helloworld/pages/detalhes.dart';
import 'package:helloworld/widget/livro_home.dart';
import 'package:helloworld/domain/livro.dart';
import 'package:helloworld/data/BD.dart';

import '../data/livro_dao.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFFABEB3),
        title: const Text(
          'Minha Biblioteca Virtual',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const CadastrarLivro();
            },
          ));
        },
        backgroundColor: Color(0xFFFABEB3),
        child: const Icon(
          Icons.import_contacts,
          color: Colors.black,
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0), child: buildFutureBuilder()),
    );
  }

  buildFutureBuilder() {
    Future<List<Livro>> futureLista = LivroDao().listarlivros();

    return FutureBuilder<List<Livro>>(
      future: futureLista,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Livro> lista = snapshot.data ?? [];

          return buildColumn(lista);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  buildColumn(List<Livro> lista) {
    return Column(children: [
      Row(children: [
        const Text(
          'Lendo',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
      Container(
        child: Row(
          children: [
            Container(
              height: 150,
              width: 120,
              child: Image.network(lista[0].imagem),
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      lista[0].titulo,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Páginas lidas: 30/${lista[0].numPaginas}',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Detalhes(livro: lista[0]);
                            },
                          ),
                        );
                      },
                      child: const Text(
                        'Detalhes',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFFFDAB9),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
      Row(children: [
        const Text(
          'Lidos',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
      Container(
        height: 110,
        child: buildListView(lista),
      ),
      const SizedBox(height: 8),
      Row(children: [
        const Text(
          'Parei de ler',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
      const SizedBox(height: 8),
      Container(
        height: 110,
        child: buildListView(lista),
      ),
    ]);
  }

  buildListView(List<Livro> lista) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: lista.length,
      itemBuilder: (context, index) {
        return LivroHome(
          livro: lista[index],
        );
      },
    );
  }
}
