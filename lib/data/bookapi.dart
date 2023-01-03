import 'dart:convert';
import 'package:helloworld/domain/livro_api.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LivroApi {
  //final String _baseUrl = "https://www.googleapis.com";

  Future<List<LivroGoogle>> buscarLivrosTitulo(String title) async {
    /*Uri url = Uri.http(_baseUrl, "/books/v1/volumes?q=intitle:$title");
    Response response = await http.get(url);*/

    final url = "https://www.googleapis.com/books/v1/volumes?q=intitle:$title";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return _parseBookJson(response.body);
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }

  Future<List<LivroGoogle>> buscarLivrosAutor(String author) async {
    final url =
        "https://www.googleapis.com/books/v1/volumes?q=inauthor:$author";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return _parseBookJson(response.body);
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }

  List<LivroGoogle> _parseBookJson(String jsonStr) {
    final jsonMap = json.decode(jsonStr);
    final jsonList = (jsonMap['items'] as List);
    return jsonList
        .map((jsonBook) => LivroGoogle(
              titulo: jsonBook['volumeInfo']['title'],
              autor: (jsonBook['volumeInfo']['authors'] as List).join(', '),
              imagem: jsonBook['volumeInfo']['imageLinks']['smallThumbnail'],
              numPaginas: jsonBook['volumeInfo']['pageCount'],
              editora: jsonBook['volumeInfo']['publisher'],
              sinopse: jsonBook['volumeInfo']['description'],
 
                
            ))
        .toList();
  }

  /*List<LivroGoogle> _parseBookJson(String jsonStr) {
    final jsonMap = json.decode(jsonStr);
    final jsonList = (jsonMap['items'] as List);
    return jsonList.map((jsonBook) => LivroGoogle.fromJson(jsonMap)).toList();
  }*/
}
