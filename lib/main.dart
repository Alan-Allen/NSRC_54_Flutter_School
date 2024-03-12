import 'package:flutter/material.dart';
import 'package:password5_54/DB/DBHelper.dart';
import 'package:password5_54/routes/router.dart';

import 'DB/userList.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DBHelper dbHelper = DBHelper();
  await dbHelper.initDb();
  await dbHelper.clearAll();
  UserList userList = UserList(0, "SuperAdmin", "admin", "1234");
  await dbHelper.insertUser(userList);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
