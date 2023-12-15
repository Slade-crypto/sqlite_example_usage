import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseSqlite {
  DatabaseSqlite._();

  static final DatabaseSqlite instance = DatabaseSqlite._();

  static Database? _database;

  get database async {
    if (_database != null) return _database;
    return await _initDatabase();
  }

  String get _conta => ''' 
    CREATE TABLE conta (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      saldo REAL
    );
  ''';
  String get _carteira => ''' 
    CREATE TABLE conta (
      sigla TEXT PRIMARY KEY,
      moeda TEXT,
      quantidade TEXT
    );
  ''';
  String get _historico => ''' 
    CREATE TABLE conta (
      data_operacao INT,
      tipo_operacao TEXT,
      moeda TEXT,
      sigla TEXT,
      valor REAL,
      quantidade TEXT
    );
  ''';

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'user_detail.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, versao) async {
    await db.execute(_conta);
    await db.execute(_carteira);
    await db.execute(_historico);
    await db.insert('conta', {'saldo': 0});
  }

  // Future<Database> openConnection() async {
  //   var databasePath = await getDatabasesPath();

  //   final databaseFinalPath = join(databasePath, 'SQLITE_EXAMPLE');

  //   return openDatabase(
  //     databaseFinalPath,
  //     version: 1,

  //     onConfigure: (db) async {
  //       await db.execute('PRAGMA foreign_keys = ON');
  //     },

  //     //Chamado no momento de criação do banco de dados SOMENTE na primeira vez que carrega o aplicativo5
  //     onCreate: (Database db, int version) {
  //       log('Oncreate chamado');
  //       final batch = db.batch();

  //       batch.execute('''
  //           create table teste(
  //             id Integer primary key autoincrement,
  //             nome varchar(200)
  //           )
  //           ''');

  //       batch.commit();
  //     },

  //     //Sera chamado sempre que a versão subir (ex: alteração 1 -> 2)
  //     onUpgrade: (db, oldVersion, newVersion) {
  //       log('onUpgrade chamado');
  //     },

  //     //Sera chamado sempre que a versão diminuir
  //     onDowngrade: (Database db, int oldVersion, int version) {
  //       log('onDowngrade chamado');
  //     },
  //   );
  // }
}
