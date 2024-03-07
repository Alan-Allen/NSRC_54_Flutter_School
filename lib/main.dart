import 'package:flutter/material.dart';
import 'package:password5_54/DB/DBHelper.dart';
import 'package:password5_54/screens/HomeScreen.dart';
import 'package:password5_54/screens/LoginScreen.dart';
import 'package:password5_54/screens/SignUpScreen.dart';
import 'package:password5_54/screens/Password_screen.dart';
import 'package:password5_54/screens/AccountScreen.dart';

import 'DB/userList.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DBHelper dbHelper = DBHelper();
  await dbHelper.initDb();
  await dbHelper.clearAll();
  UserList userList = UserList(0, "SuperAdmin", "admin", "1234");
  await dbHelper.insert(userList);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/signIn': (context) => SignInScreen(),
        '/account': (context) => AccountScreen(),
        '/password': (context) => const PasswordScreen(),
      },
      initialRoute: '/',
    );
  }
}