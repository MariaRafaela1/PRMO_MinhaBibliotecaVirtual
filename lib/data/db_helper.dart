import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String databasePath = join(path, "livro.db");
    Database db = await openDatabase(
      databasePath,
      version: 1,
      onCreate: onCreate,
    );

    print(databasePath);
    return db;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async {

    String sql = 'create table LIVRO (id INTEGER PRIMARY KEY, imagem varchar(100), titulo varchar(100), numPaginas double, autor varchar(100), isbn varchar(100), editora varchar(100));';
    await db.execute(sql);

    sql = "INSERT INTO LIVRO (id, imagem, titulo, numPaginas, autor, isbn, editora) VALUES (1,'https://lojasaraiva.vteximg.com.br/arquivos/ids/12103642/1006792064.jpg?v=637142227220900000', 'Como eu era antes de você', 320, 'Jojo Moyes', '8580579244', 'Intrínseca');";
    await db.execute(sql);

    sql = "INSERT INTO LIVRO (id, imagem, titulo, numPaginas, autor, isbn, editora) VALUES (2,'https://images-na.ssl-images-amazon.com/images/I/51ByZ-lt7eL._SX349_BO1,204,203,200_.jpg','Caminho', 352,'Josemaría Escrivá','8554991303', 'Quadrante');";
    await db.execute(sql);

    sql = "INSERT INTO LIVRO (id, imagem, titulo, numPaginas, autor, isbn, editora) VALUES (3,'https://images-na.ssl-images-amazon.com/images/I/517uEO+BVdS.jpg', 'História de uma alma', 248, 'Santa Teresa do Menino Jesus', '8515015129','Edições Loyola');";
    await db.execute(sql);

    sql = "INSERT INTO LIVRO (id, imagem, titulo, numPaginas, autor, isbn, editora) VALUES (4,'https://images-na.ssl-images-amazon.com/images/I/51lC3sHYyML._SX328_BO1,204,203,200_.jpg', 'Orgulho e preconceito', 424, 'Jane Austen','9788544001820','Martin Claret');";
    await db.execute(sql);

    sql = "INSERT INTO LIVRO (id, imagem, titulo, numPaginas, autor, isbn, editora) VALUES (5,'https://www2.unicentro.br/pet-letras/files/2017/08/maxresdefault.jpg?x84615', 'Laços de Família', 136, 'Clarisse Lispector','9788581221939', 'Rocco');";
    await db.execute(sql);

    sql = "INSERT INTO LIVRO (id, imagem, titulo, numPaginas, autor, isbn, editora) VALUES (6,'https://lojasaraiva.vteximg.com.br/arquivos/ids/13662576/Imagem1.jpg?v=637175632170330000', 'Para todos os garotos que já amei', 320, 'Jenny Han', '9788580577266', 'Intríseca');";
    await db.execute(sql);

    sql = "INSERT INTO LIVRO (id, imagem, titulo, numPaginas, autor, isbn, editora) VALUES (7,'https://images-na.ssl-images-amazon.com/images/I/71XC6h5n10L.jpg', 'Anne de Green Gables', 320, 'L. M. Montgomery', '9788551305959', 'Editora Autêntica');";
    await db.execute(sql);

    sql = "INSERT INTO LIVRO (id, imagem, titulo, numPaginas, autor, isbn, editora) VALUES (8,'https://images-na.ssl-images-amazon.com/images/I/81fXBeYYxpL.jpg', 'O pequeno Príncipe', 96, 'Antoine de Saint-Exupéry', '9788522031443', 'Agir');";
    await db.execute(sql);

    sql = "INSERT INTO LIVRO (id, imagem, titulo, numPaginas, autor, isbn, editora) VALUES (9,'https://images-na.ssl-images-amazon.com/images/I/81LxzXa2MWL.jpg', 'O morro dos ventos uivantes', 378, 'Emily Bronte', '9788537815755', 'Zahar');";
    await db.execute(sql);

    sql = "INSERT INTO LIVRO (id, imagem, titulo, numPaginas, autor, isbn, editora) VALUES (10,'https://images-na.ssl-images-amazon.com/images/I/41NhERQs9DL._SX335_BO1,204,203,200_.jpg','Trono de vidro', 392, 'Sarah J. Maas','9788501401380', 'Galera Record');";
    await db.execute(sql);

    sql = "INSERT INTO LIVRO (id, imagem, titulo, numPaginas, autor, isbn, editora) VALUES (11,'https://images-na.ssl-images-amazon.com/images/I/41xVhz5sL1L._SX346_BO1,204,203,200_.jpg', 'Os sete maridos de Evelyn Hugo', 360, 'Taylor Jenkins Reid', '8584391509', 'Paralela');";
    await db.execute(sql);

    sql = "INSERT INTO LIVRO (id, imagem, titulo, numPaginas, autor, isbn, editora) VALUES (12,'https://images-na.ssl-images-amazon.com/images/I/41XbfSiYscL._SY344_BO1,204,203,200_QL70_ML2_.jpg', '12 regras para a vida', 448, 'Jordan B. Peterson', '9788550802756', 'Alta Books');";
    await db.execute(sql);

  }
}