import 'package:flutter/material.dart';
import 'package:password5_54/component/Button.dart';
import 'package:password5_54/component/common_drawer.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Account',
      home: Scaffold(
        appBar: AppBar(),
        drawer: CommonDrawer.getDrawer(context),
        body: Column(
          children: [
            Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: SizedBox(
                        width: 300, // 调整宽度
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Enter Name',
                            labelText: 'Search',
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(width: 3, color: Colors.greenAccent),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: CustomButton(
                        onPressed: () {
                          print("Search Button Pressed");
                          String search = _searchController.text;
                          print('search: $search');
                        },
                        text: 'Search',
                        color: Colors.blue,
                        textColor: Colors.white,
                        width: 20,
                        height: 15,
                      ),
                    ),
                  ],
                ),
            ),
            const SizedBox(height: 30),
            const Expanded(
                child:SizedBox(
                  width: double.infinity, // 让 Row 占据整个屏幕宽度
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Name', style: TextStyle(color: Colors.black, fontSize: 24)),
                      Text('User', style: TextStyle(color: Colors.black, fontSize: 24)),
                      Text('Password', style: TextStyle(color: Colors.black, fontSize: 24)),
                    ],
                  ),
                ),
            ),
            const SizedBox(height: 20), // 间距
            Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                        onPressed: () {
                          print('MF Button Pressed');
                        },
                        text: 'MF',
                        color: Colors.orange,
                        textColor: Colors.white,
                        width: 10,
                        height: 10
                    ),
                    const SizedBox(width: 10),
                    const Text('Admin', style: TextStyle(color: Colors.black, fontSize: 24)),
                    const Text('admin', style: TextStyle(color: Colors.black, fontSize: 24)),
                    const Text('1234', style: TextStyle(color: Colors.black, fontSize: 24)),
                    const SizedBox(width: 10),
                    CustomButton(
                        onPressed: () {
                          print('Update Button Pressed');
                        },
                        text: 'Update',
                        color: Colors.blue,
                        textColor: Colors.white,
                        width: 10,
                        height: 10
                    ),
                    CustomButton(
                        onPressed: () {
                          print('Delete Button Pressed');
                        },
                        text: 'Delete',
                        color: Colors.red,
                        textColor: Colors.white,
                        width: 10,
                        height: 10
                    ),
                  ],
                ),
            ),
            const SizedBox(height: 20), // 间距
            Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                        onPressed: () {
                          print('MF Button Pressed');
                        },
                        text: 'MF',
                        color: Colors.orange,
                        textColor: Colors.white,
                        width: 10,
                        height: 10
                    ),
                    const SizedBox(width: 10),
                    const Text('Alan', style: TextStyle(color: Colors.black, fontSize: 24)),
                    const Text('alan', style: TextStyle(color: Colors.black, fontSize: 24)),
                    const Text('4321', style: TextStyle(color: Colors.black, fontSize: 24)),
                    const SizedBox(width: 10),
                    CustomButton(
                        onPressed: () {
                          print('Update Button Pressed');
                        },
                        text: 'Update',
                        color: Colors.blue,
                        textColor: Colors.white,
                        width: 10,
                        height: 10
                    ),
                    CustomButton(
                        onPressed: () {
                          print('Delete Button Pressed');
                        },
                        text: 'Delete',
                        color: Colors.red,
                        textColor: Colors.white,
                        width: 10,
                        height: 10
                    ),
                  ],
                ),
            ),
            const SizedBox(height: 500),
            Expanded(
              child: Align(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButton(
                          onPressed: () {
                            print('Insert Button Pressed');
                          },
                          text: 'insert',
                          color: Colors.blue,
                          textColor: Colors.white,
                          width: 40,
                          height: 15,
                        ),
                        CustomButton(
                          onPressed: () {
                            print('Intput Button Pressed');
                          },
                          text: 'Input',
                          color: Colors.green,
                          textColor: Colors.white,
                          width: 40,
                          height: 15,
                        ),
                        CustomButton(
                          onPressed: () {
                            print('Output Button Pressed');
                          },
                          text: 'Output',
                          color: Colors.redAccent,
                          textColor: Colors.white,
                          width: 40,
                          height: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}