import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:helloworld/pages/barra_inferior.dart';

import '../data/livro_dao.dart';
import '../domain/livro.dart';

class CadastrarLivro extends StatefulWidget {
  const CadastrarLivro({Key? key}) : super(key: key);

  @override
  State<CadastrarLivro> createState() => _CadastrarLivroState();
}

class _CadastrarLivroState extends State<CadastrarLivro> {
  ImagePicker imagePicker = ImagePicker();
  File? imagemSelecionada;

  TextEditingController tituloController = TextEditingController();
  TextEditingController autorController = TextEditingController();
  TextEditingController editoraController = TextEditingController();
  TextEditingController pgController = TextEditingController();
  TextEditingController isbnController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cadastrar livro',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFFABEB3),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: <Widget>[
            seletorImg(),
            //formulario(),
            SizedBox(
              height: 20,
            ),
            buildBody(),
          ],
        ),
      ),
    );
  }

  buildBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo Obrigatório";
                    }

                    return null;
                  },
                  controller: tituloController,
                  decoration: const InputDecoration(
                    labelText: 'Título',
                    helperText: '',
                    hintText: 'Título do livro',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide:
                          BorderSide(color: Colors.amberAccent, width: 1),
                    ),
                  )),
              const SizedBox(height: 6),
              TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo Obrigatório";
                    }

                    return null;
                  },
                  controller: autorController,
                  decoration: const InputDecoration(
                    labelText: 'Autor(a)',
                    helperText: '',
                    hintText: 'Nome do Autor(a)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide:
                          BorderSide(color: Colors.amberAccent, width: 1),
                    ),
                  )),
              const SizedBox(height: 6),
              TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo Obrigatório";
                    }

                    return null;
                  },
                  controller: editoraController,
                  decoration: const InputDecoration(
                    labelText: 'Editora',
                    helperText: '',
                    hintText: 'Nome da Editora',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide:
                          BorderSide(color: Colors.amberAccent, width: 1),
                    ),
                  )),
              const SizedBox(height: 6),
              TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo Obrigatório";
                    }

                    return null;
                  },
                  controller: pgController,
                  decoration: const InputDecoration(
                    labelText: 'Páginas',
                    helperText: '',
                    hintText: 'Número de Páginas',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide:
                          BorderSide(color: Colors.amberAccent, width: 1),
                    ),
                  )),
              const SizedBox(height: 6),
              TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo Obrigatório";
                    }

                    return null;
                  },
                  controller: isbnController,
                  decoration: const InputDecoration(
                    labelText: 'ISBN',
                    helperText: '',
                    hintText: 'Número do ISBN',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide:
                          BorderSide(color: Colors.amberAccent, width: 1),
                    ),
                  )),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: onPressed,
                style:
                    ElevatedButton.styleFrom(primary: const Color(0xFFFABEB3)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    'Salvar',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onPressed() async {
   String autorDigitado = autorController.text;
    String tituloDigitado = tituloController.text;
    String editoraDigitado = editoraController.text;
    double pgDigitado = double.parse(pgController.text);
    String isbnDigitado = isbnController.text;

    Livro livroCriado = Livro(
      titulo: tituloDigitado,
      autor: autorDigitado,
      editora: editoraDigitado,
      numPaginas: pgDigitado,
      isbn: isbnDigitado,
      imagem:
          'https://amici.com.br/wp-content/uploads/sites/83/2020/04/imagem-indispon%C3%ADvel.jpg',
    );
    await LivroDao().salvarLivro(livro: livroCriado);
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const BarraInferior();
      }));
    } else {
      showSnackBar("Erro na validação");
    }
  }

  showSnackBar(String msg) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(
        vertical: 80,
        horizontal: 32,
      ),
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget seletorImg() {
    return Center(
        child: Stack(
      children: <Widget>[
        Container(
            height: 200,
            width: 150,
            child: Image.asset(
              'assets/images/selector.jpg',
              fit: BoxFit.cover,
            )),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.grey,
              size: 28.0,
            ),
          ),
        ),
      ],
    ));
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20.0,
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Escolha uma foto para a capa do livro',
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.image),
                onPressed: () {
                  foto();
                },
                //label: Text('Galeria'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  foto() async {
    final PickedFile? imagemTemporaria =
        await imagePicker.getImage(source: ImageSource.gallery);
    if (imagemTemporaria != null)
      setState(() {
        imagemSelecionada = File(imagemTemporaria.path);
      });
  }
}
