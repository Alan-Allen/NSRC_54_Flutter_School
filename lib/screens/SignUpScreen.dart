import 'package:flutter/material.dart';
import 'package:password5_54/component/common_drawer.dart';

import '../component/Button.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.home), // 使用home图标作为返回主页按钮
            onPressed: () {
              Navigator.pushNamed(context, '/');
              print('Back to home');
            },
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      width: 500, // 调整宽度
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: 'Enter your name',
                          labelText: 'Name',
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 3, color: Colors.greenAccent),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: 500, // 调整宽度
                      child: TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          hintText: 'Enter your username',
                          labelText: 'Username',
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 3, color: Colors.greenAccent),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: 500, // 调整宽度
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 3, color: Colors.greenAccent),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 200),
                  Center(
                    child: CustomButton(
                      onPressed: () {
                        print("Login Button Pressed");
                        String name = _nameController.text;
                        String username = _usernameController.text;
                        String password = _passwordController.text;
                        print('Name: $name, Username: $username, Password: $password');
                      },
                      text: 'Sign Up',
                      color: Colors.blue,
                      textColor: Colors.white,
                      width: 40,
                      height: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
