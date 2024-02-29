import 'package:flutter/material.dart';
import 'package:password5_54/screens/HomeScreen.dart';
import 'package:password5_54/screens/LoginScreen.dart';
import 'package:password5_54/screens/SignUpScreen.dart';
import 'package:password5_54/screens/Password_screen.dart';
import 'package:password5_54/screens/AccountScreen.dart';
void main() {
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

