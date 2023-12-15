import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:storage/database/database_sqlite.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _database();
    super.initState();
  }

  Future<void> _database() async {
    // final database = await DatabaseSqlite().openConnection();

    // database.insert('teste', {'nome': 'Renan'});
    // database.delete('teste', where: 'nome = ?', whereArgs: ['Renan']);
    // database.update('teste', {'nome': 'Renan Feliciano'}, where: 'nome = ?', whereArgs: ['Renan']);

    // database.rawInsert('insert into teste values(null, ?)', ['Ximbinha']);
    // database.rawUpdate('update teste set nome = ? where id = ?', ['Rodrigo Academia do Flutter', 5]);
    // database.rawDelete('delete from teste where id = ?', [5]);
    // var result = await database.rawQuery('select * from teste');

    // var result = await database.query('teste');

    // log(result.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(),
    );
  }
}
