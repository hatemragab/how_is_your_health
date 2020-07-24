import 'package:how_is_your_health/models/UserModel.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart' as p;

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; // Singleton DatabaseHelper
  static Database _database; // Singleton Database

  String userTable = 'user_table';
  String userId = 'id';
  String userName = 'name';
  String userEmail = 'email';
  String userPhone = 'phone';
  String userPassword = 'password';

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper
          ._createInstance(); // This is executed only once, singleton object

    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    //Get path of the directory for android and iOS.

    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, 'cards.db');

    //open/create database at a given path
    var cartDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);

    return cartDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $userTable($userId INTEGER PRIMARY KEY AUTOINCREMENT, $userName TEXT, '
        '$userEmail TEXT UNIQUE, $userPhone TEXT, $userPassword TEXT )');
  }


  Future<int> insertUser(UserModel userModel) async {
    Database db = await this.database;
    var result = await db.insert(userTable, userModel.toMap());
    return result;
  }

  Future<dynamic> loginUser(String email, String password) async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery(
        'SELECT * FROM $userTable WHERE email = "$email" AND password = "$password" LIMIT 1');
    if (x.length == 0) {
      print('No USERS FOUNNNNNNNNNNNNNNNDED');
      return '';
    } else {
      print('user founded is  ${x[0]['email']}');
      return  x ;
    }


  }
}
