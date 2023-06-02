

import 'dart:io';

import 'package:new_demo/helper/user_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{

  //Singleton pattern
  static final DatabaseHelper _instance =
  DatabaseHelper._internal();


  factory DatabaseHelper() {
    return _instance;
  }
  DatabaseHelper._internal();

  Database? _database;

  Database getDatabase(){
    return _database!;

  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    _database =  await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute(createUsersTableQuery);
          await db.execute(createUserDetailsTableQuery);
        });
  }

/*  Future createUserTable(Database db) async{
    await db.execute(
        'CREATE TABLE ${UserRepository.tableName} ('
            '${UserRepository.id} INTEGER PRIMARY KEY,'
            ' ${UserRepository.name} TEXT NOT NULL'
            ')');
  }*/


  final createUserDetailsTableQuery = '''
  CREATE TABLE user_details (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    content TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id)
  )
''';
  
  final createUsersTableQuery = '''
  CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    password TEXT
  )
''';


}