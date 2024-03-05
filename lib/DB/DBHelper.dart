import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' show join;

class UserList {
  int? id; // 将id设为可空，因为它将自动生成
  final String name;
  final String user;
  final String password;

  UserList({this.id, required this.name, required this.user, required this.password});

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      'name': name,
      'user': user,
      'password': password,
    };
    if (id != null) {
      map['id'] = id; // 如果id不为空，则赋值给map中的'id'
    }
    return map;
  }

  UserList.fromMap(Map<String, Object?> map)
      : id = map['id'] as int?, // 从map中提取id
        name = map['name'] as String,
        user = map['user'] as String,
        password = map['password'] as String;
}

class UserProvider {
  late Database db;

  // 打开数据库的方法，传入数据库路径作为参数
  Future open(String path) async {
    // 获取当前应用的文档目录路径
    var databasesPath = await getDatabasesPath();
    // 拼接数据库文件路径
    String path = join(databasesPath, 'user.db');

    // 打开数据库连接
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // 如果不存在，则创建userList表
          await db.execute('''
          create table userList ( 
            id integer primary key autoincrement, 
            name text not null,
            user text not null,
            password text not null)
          ''');
        }
    );
  }

  // 将新用户插入到userList表中的方法
  Future<UserList> insert(UserList userList) async {
    // 将用户插入到userList表中，并分配自动生成的id
    userList.id = await db.insert('userList', userList.toMap());
    return userList;
  }

  Future<List<UserList>> getAllUsers() async {
    final List<Map<String, dynamic>> maps = await db.query('users');

    // 将查询结果映射为UserList对象列表
    return List.generate(maps.length, (i) {
      return UserList(
        id: maps[i]['id'],
        name: maps[i]['name'],
        user: maps[i]['user'],
        password: maps[i]['password'],
      );
    });
  }

  Future<UserList?> getUser(int id) async {
    List<Map<String, dynamic>> maps = await db.query(
      'userList',
      columns: ['id', 'name', 'user', 'password'], // 列出要查询的列
      where: 'id = ?', // 设置查询条件
      whereArgs: [id], // 设置查询条件的参数
    );
    if (maps.isNotEmpty) {
      return UserList.fromMap(maps.first); // 如果查询到结果，则将第一个结果转换为 UserList 对象并返回
    }
    return null; // 如果未查询到结果，则返回 null
  }

  Future<int> delete(int id) async {
    return await db.delete('userList', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(UserList userList) async {
    return await db.update('userList', userList.toMap(),
        where: 'id = ?', whereArgs: [userList.id]);
  }

  Future close() async => db.close();
}
