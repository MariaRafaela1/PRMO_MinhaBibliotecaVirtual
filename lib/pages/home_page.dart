import 'package:flutter/material.dart';
import 'package:helloworld/pages/cadastrar_livro.dart';
import 'package:helloworld/pages/detalhes.dart';
import 'package:helloworld/widget/livro_home.dart';
import 'package:helloworld/domain/livro.dart';
import 'package:helloworld/data/BD.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Livro> lista = BD.listaLivros;
  Livro get l => BD.listaLivros[0];

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
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
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
                  child: Image.network(l.imagem),
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          l.titulo,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Páginas lidas: 30/${l.numPaginas}',
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
                                  return Detalhes(livro: l);
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
                            primary: Color(0xFFFABEB3),
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
            child: buildListView(context),
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
            child: buildListView(context),
          ),
        ]),
      ),
    );
  }

  buildListView(BuildContext context) {
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
