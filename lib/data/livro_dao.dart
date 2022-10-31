import 'dart:convert';

import 'package:helloworld/data/db_helper.dart';
import 'package:helloworld/domain/livro.dart';
import 'package:sqflite/sqlite_api.dart';

class LivroDao {

  Future<List<Livro>> listarlivros() async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM livro';
    var result = await db.rawQuery(sql);

    List<Livro> lista = <Livro>[];
    for (var json in result) {
      Livro livro = Livro.fromJson(json);
      lista.add(livro);
    }

    return lista;
  }

}