import 'dart:async';
import 'dart:io';

import 'package:app/models/user.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

abstract class DatabaseHelper{

  static final DatabaseHelper _instance=new DatabaseHelper().internal();

  factory DatabaseHelper()=>_instance;

  final String tableUser="userTable";
  final String columnId="id";
  final String columnUsername="username";
  final String columnPassword="password";

  static Database _db;

  Future<Database> get db async{
    if (_db !=null){
      return _db;
    }
    _db=await initDb();
        return _db;
      }  
        DatabaseHelper internal();
    
      initDb() async {
        Directory documentDirecory=await getApplicationDocumentsDirectory();
        String path=join(documentDirecory.path,"maindb.db");

        var ourDb=await openDatabase(path,version:1,onCreate:_onCreate);
        return ourDb;
              }

              /*
              ID    | USERNAME   | PASSWORD
              1       hashika       1234
              2        kamal         kamal 
               */
        
         Future _onCreate(Database db, int newversion) async {
           await db.execute(
             "CREATE TABLE $tableUser($columnId INTEGER PRIMARY KEY,$columnUsername TEXT,$columnPassword TEXT)"
           );
  }
  //drud -create delete update

  //insertion

  Future<int> saveUser(User user) async{
    var dbClient=await db;
    int res=await dbClient.insert("$tableUser",user.toMap());
    return res;
  }
  Future<List> getAllUsers() async{
    var dbClient=await db;
    var result=await dbClient.rawQuery("SELECT * FROM $tableUser");

    
        return result.toList();
  }
  Future<int> getCount() async{
    var dbClient=await db;
    return Sqflite.firstIntValue(
      await dbClient.rawQuery('SELECT COUNT(*) FROM $tableUser'));
  }
  Future<User> getUser(int id) async{
    var dbClient=await db;
    var result=await dbClient.rawQuery("SELECT * FROM $tableUser WHERE $columnId=$id");
    return new User.fromMap(result.first);
  }
  Future<int> deleteItem(int id) async{
    var dbClient=await db;
    return await dbClient.delete(tableUser,
    where: "$columnId=?",whereArgs: [id]);
  }
  Future<int> updateUser(User user) async{
    var dbClient=await db;
    return await dbClient.update(tableUser,
    user.toMap(),where:"$columnId =?",whereArgs: [user.id]);
  }
  Future close()async{
    var dbClient=await db;
    return dbClient.close();
  }

}