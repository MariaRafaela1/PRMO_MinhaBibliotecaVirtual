import 'dart:convert';

import 'package:helloworld/data/db_helper_user.dart';
import 'package:helloworld/domain/usuario.dart';
import 'package:sqflite/sqlite_api.dart';

class UsuarioDao {
  Future<List<Usuario>> listarusuarios() async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM usuario';
    var result = await db.rawQuery(sql);

    List<Usuario> lista = <Usuario>[];
    for (var json in result) {
      Usuario usuario = Usuario.fromJson(json);
      lista.add(usuario);
    }

    return lista;
  }
}
