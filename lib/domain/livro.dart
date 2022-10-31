class Livro {
  late final String imagem;
  late final String titulo;
  late final double numPaginas;
  late final String autor;
  late final String isbn;
  late final String editora;

  Livro({
    required this.imagem,
    required this.titulo,
    required this.numPaginas,
    required this.autor,
    required this.isbn,
    required this.editora,
  });




  Map<String, Object?> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['titulo'] = titulo;
    data['autor'] = autor;
    data['imagem'] = imagem;
    data['numPaginas'] = numPaginas;
    data['isbn'] = isbn;
    data['editora'] = editora;


    return data;
  }

  Livro.fromJson(Map<String, dynamic> json) {
    autor = json['autor'];
    imagem = json['imagem'];
    titulo = json['titulo'];
    numPaginas = json['numPaginas'];
    isbn = json['isbn'];
    editora = json['editora'];
  }
}
