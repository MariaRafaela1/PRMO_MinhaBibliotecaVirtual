import 'package:flutter/material.dart';
import 'package:helloworld/pages/home_page.dart';
import 'package:helloworld/pages/biblioteca.dart';
import 'package:helloworld/pages/lista_desejos.dart';
import 'package:helloworld/pages/perfil.dart';

class BarraInferior extends StatefulWidget {
  const BarraInferior({Key? key}) : super(key: key);

  @override
  State<BarraInferior> createState() => _BarraInferiorState();
}

class _BarraInferiorState extends State<BarraInferior> {
  //telas
  int _PaginaAtual = 0;
  final List<Widget> _telas = [
    HomePage(),
    Biblioteca(),
    ListaDesejos(),
    Perfil(),
  ];
  //telas
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[_PaginaAtual],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _PaginaAtual,
        onTap: (int indice) {
          setState(() {
            _PaginaAtual = indice;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_library),
            label: "Biblioteca",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: "Lista de Desejos",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
            label: "Perfil",
          ),
        ],
      ),
    );
  }
}
