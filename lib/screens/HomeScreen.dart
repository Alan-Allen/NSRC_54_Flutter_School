import 'package:flutter/material.dart';
import 'package:password5_54/component/Button.dart';
import 'package:password5_54/component/common_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HomeScreen',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
          ),
          drawer: CommonDrawer.getDrawer(context),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '帳號管理系統\nAccount Management System',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      onPressed: () {
                        print('LoginScreen Button Pressed');
                        Navigator.pushNamed(context, '/login');
                      },
                      width: 55,
                      height: 30,
                      text: 'Login',
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                    CustomButton(
                      onPressed: () {
                        print('SignInScreen Button Pressed');
                        Navigator.pushNamed(context, '/signIn');
                      },
                      width: 50,
                      height: 30,
                      text: 'Sign Up',
                      color: Colors.orange,
                      textColor: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      onPressed: () {
                        print('AccountSettingScreen Button Pressed');
                        Navigator.pushNamed(context, '/account');
                      },
                      width: 45,
                      height: 20,
                      text: 'Account\nSeting',
                      color: Colors.redAccent,
                      textColor: Colors.white,
                    ),
                    CustomButton(
                      onPressed: () {
                        print('PasswordScreen Button Pressed');
                        Navigator.pushNamed(context, '/password');
                      },
                      width: 40,
                      height: 20,
                      text: 'Random\nPassword',
                      color: Colors.lightGreen,
                      textColor: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomButton(
                  onPressed: () {
                    print('KeySettingScreen Button Pressed');
                    Navigator.pushNamed(context, '/');
                  },
                  width: 45,
                  height: 20,
                  text: 'Key Setting',
                  color: Colors.pink,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        )
    );
  }
}