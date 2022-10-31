import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String databasePath = join(path, "usuario.db");
    Database db = await openDatabase(
      databasePath,
      version: 1,
      onCreate: onCreate,
    );

    print(databasePath);
    return db;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async {

    String sql = 'create table USUARIO (id INTEGER PRIMARY KEY, nome varchar(100), email varchar(100));';
    await db.execute(sql);

    sql = "INSERT INTO USUARIO (id, nome, email) VALUES (1,'Nome Exemplo', 'nome@exemplo');";
    await db.execute(sql);

  }
}