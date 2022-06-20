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
  int _HomePage = 0;
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
      body: _telas[_HomePage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _HomePage,
        onTap: aoMudarDeAba,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_library,
              color: Colors.black,
            ),
            label: "biblioteca",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.black,
            ),
            label: "lista de desejos",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Colors.black,
            ),
            label: "perfil",
          ),
        ],
      ),
    );
  }

  void aoMudarDeAba(int indice) {
    setState(() {
      _HomePage = indice;
    });
  }
}
