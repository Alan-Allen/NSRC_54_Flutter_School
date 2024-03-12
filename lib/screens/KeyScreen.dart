import 'package:flutter/material.dart';

class KeyScreen extends StatefulWidget {
  const KeyScreen({super.key});

  @override
  _KeyScreenState createState() => _KeyScreenState();
}

class _KeyScreenState extends State<KeyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.pushNamed(context, '/');
            print('Back to home');
          },
        ),
        title: const Text('KeyMangement'),
      ),
    );
  }
}