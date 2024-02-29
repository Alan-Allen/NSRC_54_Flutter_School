import 'package:flutter/material.dart';
import 'package:password5_54/component/Button.dart';
import 'package:password5_54/component/common_drawer.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: Scaffold(
        appBar: AppBar(),
        drawer: CommonDrawer.getDrawer(context),
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
                        String username = _usernameController.text;
                        String password = _passwordController.text;
                        print('Username: $username, Password: $password');
                      },
                      text: 'Login',
                      color: Colors.blue,
                      textColor: Colors.white,
                      width: 40,
                      height: 15,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                text: 'Home',
                color: Colors.transparent,
                textColor: Colors.black,
                width: 20,
                height: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
