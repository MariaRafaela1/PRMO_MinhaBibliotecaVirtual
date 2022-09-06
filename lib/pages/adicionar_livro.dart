import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:helloworld/pages/barra_inferior.dart';

class Adicionar extends StatefulWidget {
  Adicionar({Key? key}) : super(key: key);

  @override
  State<Adicionar> createState() => _AdicionarState();
}

class _AdicionarState extends State<Adicionar> {
  ImagePicker imagePicker = ImagePicker();
  File? imagemSelecionada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Adicionar livro',
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
            SizedBox(
              height: 20,
            ),
            tituloTextField(),
            SizedBox(
              height: 5,
            ),
            autorTextField(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return const BarraInferior();
                }));
              },
              child: const Text(
                'Salvar',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFFABEB3),
              ),
            ),
          ],
        ),
      ),
    );
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
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  foto();
                },
                label: Text('Galeria'),
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

  Widget tituloTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFFABEB3),
            width: 2,
          ),
        ),
        labelText: 'Título',
        helperText: '',
        hintText: 'Título do livro',
      ),
    );
  }

  Widget autorTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFFABEB3),
            width: 2,
          ),
        ),
        labelText: 'Autor(a)',
        helperText: '',
        hintText: 'Autor(a) do livro',
      ),
    );
  }

