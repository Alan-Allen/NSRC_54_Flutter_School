import 'dart:io';
import 'package:password5_54/DB/userList.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;

  Future<Database?> get database async {
    _db = await initDb();
    return _db;
  }

  Future<Database> initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'user.db');
    var database = await openDatabase(path, version: 1, onCreate: _createTable);
    return database;
  }

  void _createTable(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY,
        name TEXT,
        user TEXT,
        password TEXT
      )
    ''');
  }

  Future<void> insertUser(UserList userList) async {
    try {
      var dbClient = await database; // Ensure database is initialized
      await dbClient?.transaction((txn) async {
        await txn.rawInsert('''
          INSERT INTO users(name, user, password) 
          VALUES('${userList.name}', '${userList.user}', '${userList.password}')
        ''');
      });
    } catch (e) {
      print('Error inserting user: $e');
    }
  }

  Future<List<UserList>> getUsers() async {
    try {
      var dbClient = await database;
      List<Map>? maps = (await dbClient?.query('users'))?.cast<Map>();
      List<UserList> users = [];
      if (maps!.isNotEmpty) {
        for (int i = 0; i < maps.length; i++) {
          users. add(UserList.fromMap(maps[i]));
        }
      }
      return users;
    } catch (e) {
      print('Error getting users: $e');
      return [];
    }
  }
}
