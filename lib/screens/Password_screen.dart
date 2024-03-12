import 'package:flutter/material.dart';
import 'package:password5_54/component/Button.dart';
import 'dart:math';
import 'package:password5_54/component/common_drawer.dart';

import '../routes/router.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key});

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _lengthController = TextEditingController();
  final TextEditingController _characterController = TextEditingController();
  final TextEditingController _generatedPasswordController = TextEditingController();
  String _generatedPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            router.go('/');
            print('Back to home');
          },
        ),
        title: const Text('Random Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Enter the length of the password:',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _lengthController,
              decoration: InputDecoration(
                hintText: 'Enter length',
                labelText: 'Length',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: Colors.greenAccent),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _characterController,
              decoration: InputDecoration(
                hintText: 'Enter Character (optional)',
                labelText: 'Character',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: Colors.greenAccent),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
            const SizedBox(height: 15),
            CustomButton(
              onPressed: () {
                print('Create Button Pressed');
                String length = _lengthController.text;
                String character = _characterController.text;
                if (character.isEmpty) {
                  character =
                  'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()-_=+';
                }
                int passwordLength = int.tryParse(length) ?? 8;
                setState(() {
                  _generatedPassword = generatePassword(passwordLength, allowedCharacters: character);
                  _generatedPasswordController.text = _generatedPassword;
                  print('Length: $length, Character: $character, Password: $_generatedPassword');
                });
              },
              text: 'Random',
              color: Colors.blue,
              textColor: Colors.white,
              width: 30,
              height: 20,
            ),
            const SizedBox(height: 15),
            TextField( // Use TextField instead of Text for editing
              controller: _generatedPasswordController,
              decoration: const InputDecoration(
                labelText: 'Generated Password', // Change label
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String generatePassword(int length, {String? allowedCharacters}) {
    allowedCharacters ??= '';
    Random random = Random();
    String password = '';

    for (int i = 0; i < length; i++) {
      int index = random.nextInt(allowedCharacters.length);
      password += allowedCharacters[index];
    }

    return password;
  }
}
