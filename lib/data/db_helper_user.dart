import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String databasePath = join(path, "user.db");
    Database db = await openDatabase(
      databasePath,
      version: 1,
      onCreate: onCreate,
    );

    print(databasePath);
    return db;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sql =
        'create table USUARIO (email varchar(100) PRIMARY KEY, nome varchar(100), senha varchar(100));';
    await db.execute(sql);

    /*sql = "INSERT INTO USUARIO ( email, nome, senha) VALUES ('nome@exemplo', 'Nome Exemplo', '123456' );";
    await db.execute(sql);*/


    
  }
}
