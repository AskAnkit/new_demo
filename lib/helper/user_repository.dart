

import 'package:new_demo/helper/database_helper.dart';
import 'package:new_demo/helper/user_model.dart';
import 'package:sqflite/sqflite.dart';


class UserRepository{

  static const tableName = "User";
  static const id ="id";
  static const name = "name";

  late Database _database;

  UserRepository() {
    _database = DatabaseHelper().getDatabase();
  }

  Future<UserModel?> createUser(UserModel model) async{
    var res = await _database.insert(tableName, model.toJson());
    if(res!=0){
      model.id = res;
      return model;
    }else{
      return null;
    }
  }
  Future updateUser(int id, UserModel model) async{
    var res = await _database.update(tableName, model.toJson(),
        where: '$id = ?', whereArgs: [id]);
    return res;
  }
  Future<UserModel?> getUser(int id) async{
    var res = await _database.query(tableName, where: "$id = ?", whereArgs: [id]);
    return res.isNotEmpty ? UserModel.fromJson(res.first) : null;
  }

  Future<List<UserModel>> getAllUsers() async {
    var res = await _database.query(tableName);
    List<UserModel> list =
    res.isNotEmpty ? res.map((c) => UserModel.fromJson(c)).toList() : [];
    return list;
  }

  Future deleteClient(int id) async {
    return _database.delete(tableName, where: "$id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    _database.rawDelete("Delete * from $tableName");
  }
}