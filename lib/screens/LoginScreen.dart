import 'package:flutter/material.dart';
import 'package:password5_54/DB/userList.dart';
import 'package:password5_54/component/Button.dart';
import 'package:password5_54/routes/router.dart';
import '../DB/DBHelper.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.home), // 使用home图标作为返回主页按钮
            onPressed: () {
              router.go('/');
              print('Back to home');
            },
          ),
          title: const Text('Login Page'),
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
                  const SizedBox(height: 100),
                  Center(
                    child: CustomButton(
                      onPressed: () async {
                        print("Login Button Pressed");
                        String username = _usernameController.text;
                        String password = _passwordController.text;
                        clearInput();
                        bool login = await validateUser(username, password);
                        print('Username: $username, Password: $password, Login?: $login');
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
          ],
        ),
      ),
    );
  }

  Future<bool> validateUser(String user, String password) async {
    try {
      DBHelper dbHelper = DBHelper();
      await dbHelper.initDb();
      List<UserList> users = await dbHelper.getUser(user);

      print('getUser:');
      for (var user in users) {
        print('ID: ${user.id}, Name: ${user.name}, Username: ${user.user}, Password: ${user.password}');
      }

      return users.isNotEmpty && users.first.password == password;
    } catch (e) {
      print('Error validating user: $e');
      return false;
    }
  }

  void clearInput() {
    _usernameController.clear();
    _passwordController.clear();
  }
}
