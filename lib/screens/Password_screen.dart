import 'package:flutter/material.dart';
import 'package:password5_54/component/Button.dart';
import 'dart:math';
import 'package:password5_54/component/common_drawer.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _controller = TextEditingController();
  String _generatedPassword = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Password',
      home: Scaffold(
        appBar: AppBar(),
        drawer: CommonDrawer.getDrawer(context),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'Enter the length of the password:',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: 500,
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Enter length',
                    labelText: 'Length',
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3, color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            CustomButton(
              onPressed: () {
                print('Create Button Pressed');
                String length = _controller.text;
                int passwordLength = int.tryParse(length) ?? 8;
                setState(() {
                  _generatedPassword = Password(passwordLength);
                  print('length: $length, password: $_generatedPassword');
                });
              },
              text: 'Enter',
              color: Colors.blue,
              textColor: Colors.white,
              width: 30,
              height: 20,
            ),
            const SizedBox(height: 20),
            Text(
              'Random Password: $_generatedPassword',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String Password(int length) {
    const String lowercaseLetters = 'abcdefghijklmnopqrstuvwxyz';
    const String uppercaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const String numbers = '0123456789';
    const String symbols = '!@#\$%^&*()-_=+';

    String characters = lowercaseLetters + uppercaseLetters + numbers + symbols;

    Random random = Random();
    String password = '';

    for (int i = 0; i < length; i++) {
      int index = random.nextInt(characters.length);
      password += characters[index];
    }

    return password;
  }
}
