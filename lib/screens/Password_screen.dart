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
  final TextEditingController _lengthController = TextEditingController();
  final TextEditingController _characterController = TextEditingController();
  String _generatedPassword = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Password',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.home), // 使用home图标作为返回主页按钮
            onPressed: () {
              Navigator.pushNamed(context, '/');
              print('Back to home');
            },
          ),
          title: const Text('Random Password'),
        ),
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
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 400,
                  child: TextField(
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
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 400,
                  child: TextField(
                    controller: _characterController,
                    decoration: InputDecoration(
                      hintText: 'Enter Character',
                      labelText: 'Character',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 3, color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            CustomButton(
              onPressed: () {
                print('Create Button Pressed');
                String length = _lengthController.text;
                String character = _characterController.text;
                if(character == '') {
                  character = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()-_=+';
                }
                int passwordLength = int.tryParse(length) ?? 8;
                setState(() {
                  _generatedPassword = Password(passwordLength, allowedCharacters: character);
                  print('length: $length, character: $character, password: $_generatedPassword');
                });
              },
              text: 'Enter',
              color: Colors.blue,
              textColor: Colors.white,
              width: 30,
              height: 20,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Text(
                'Random Password: \n $_generatedPassword',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String Password(int length, {String? allowedCharacters}) {
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
