import 'package:flutter/material.dart';
import 'package:password5_54/component/common_drawer.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Password',
      home: Scaffold(
        appBar: AppBar(),
        drawer: CommonDrawer.getDrawer(context),
      ),
    );
  }
}