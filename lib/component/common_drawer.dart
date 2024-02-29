import 'package:flutter/material.dart';

class CommonDrawer {
  static Drawer getDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            title: const Text('Login'),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
          ListTile(
            title: const Text('SignIn'),
            onTap: () {
              Navigator.pushNamed(context, '/signIn');
            },
          ),
          ListTile(
            title: const Text('account'),
            onTap: () {
              Navigator.pushNamed(context, '/account');
            },
          ),
          ListTile(
            title: const Text('Random Password'),
            onTap: () {
              Navigator.pushNamed(context, '/password');
            },
          ),
        ],
      ),
    );
  }
}