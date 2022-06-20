import 'package:flutter/material.dart';
import 'package:helloworld/pages/cadastrar_livro.dart';
import 'package:helloworld/pages/detalhes.dart';
import 'package:helloworld/widget/livro_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFFABEB3),
        title: Text(
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
        backgroundColor: Color(0xFFFFE7B2),
        child: const Icon(
          Icons.import_contacts,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(children: [
          Column(children: [
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
                    child: Image.network(
                      'https://lojasaraiva.vteximg.com.br/arquivos/ids/12110250/1007739147.jpg?v=637142252496370000',
                    ),
                  ),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                      const Text(
                        'Harry Potter e a Pedra Filosofal',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Páginas lidas: 30/100',
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
                                return const Detalhes();
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
                          primary: Color(0xFFFFE7B2),
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
            const SizedBox(height: 8),
            Row(children: [
              const LivroHome(
                imagem: 'https://lojasaraiva.vteximg.com.br/arquivos/ids/12103642/1006792064.jpg?v=637142227220900000',
              ),
              const SizedBox(width: 8),
              const LivroHome(
                imagem: 'https://images-na.ssl-images-amazon.com/images/I/81LxzXa2MWL.jpg',
              ),
              const SizedBox(width: 8),
              const LivroHome(
                imagem: 'https://images-na.ssl-images-amazon.com/images/I/81zxDaAx4WL.jpg',
              ),
            ]),
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
            Row(
              children: [
                const LivroHome(
                  imagem: 'https://marketplace.canva.com/EAD0UPCkitY/1/0/1024w/canva-capa-de-livro-de-suspense-monocrom%C3%A1tica-com-foto-de-floresta-U1dpnJ3bwKw.jpg',
                ),
                const SizedBox(width: 8),
                const LivroHome(
                  imagem: 'https://2.bp.blogspot.com/-MNvKKmiYtY8/V11uBa_F-CI/AAAAAAAAHvM/seRXB9HmdVsNh2km6mEa6rCRYLnvk33bgCKgB/s1600/jojo%2Bmoyes%2Bem%2Bbusca%2Bde%2Babrigo%2B2015.jpg',
                ),
                const SizedBox(width: 8),
                const LivroHome(
                  imagem: 'https://4.bp.blogspot.com/-5Ds2er9lMmM/WAVvM0DV3jI/AAAAAAAACDQ/geoypVZwpvEBkNyPexHetaCalpU_LFd_gCLcB/s1600/Labirinto-livro-DarkSide-Books-capa-site.png',
                ),
              ],
            ),
          ]),
        ]),
      ),
    );
  }
}
