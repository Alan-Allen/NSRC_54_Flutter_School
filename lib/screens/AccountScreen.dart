import 'package:flutter/material.dart';
import 'package:password5_54/DB/userList.dart';
import 'package:password5_54/DB/DBHelper.dart';
import 'package:password5_54/component/Button.dart';
import 'package:password5_54/component/common_drawer.dart';

class AccountScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  UserList userList = UserList("", "", "", "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home), // 使用home图标作为返回主页按钮
          onPressed: () {
            Navigator.pushNamed(context, '/');
            print('Back to home');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
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
                  const SizedBox(width: 20),
                  _buildButton('Search', Colors.blue, () {
                    print("Search Button Pressed");
                    String search = _searchController.text;
                    print('search: $search');
                  }),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Table(
              border: TableBorder.all(
                color: Colors.black87,
                width: 2.0,
                style: BorderStyle.solid,
              ),
              children: [
                _buildTableHeaderRow(['MF', 'Name', 'User', 'Password', 'Other']),
                _buildTableRow(['Admin', 'admin', '1234'], context),
                _buildTableRow(['Alan', 'Alan_0811', '4321'], context),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton2('Insert', Colors.blue, () {
                      print('Insert Button Pressed');
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Insert'),
                            content: Column(
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
                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              CustomButton(
                                onPressed: () {
                                  print('modal close Pressed');
                                  Navigator.of(context).pop();
                                },
                                text: 'Close',
                                color: Colors.orangeAccent,
                                textColor: Colors.white,
                                width: 15,
                                height: 10,
                              ),
                              CustomButton(
                                onPressed: () {
                                  print('modal save Pressed');
                                  Navigator.of(context).pop();
                                },
                                text: 'Save',
                                color: Colors.blue,
                                textColor: Colors.white,
                                width: 15,
                                height: 10,
                              ),
                            ],
                          );
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  static TableRow _buildTableRow(List<String> data, BuildContext context, {bool isHeader = false}) {
    List<Widget> children = [];

    children.add(
      SizedBox(
        child: CustomButton(
          onPressed: () {
            print('MF Button Pressed');
          },
          text: 'MF',
          color: Colors.red,
          textColor: Colors.white,
          width: 10,
          height: 10,
        ),
      ),
    );

    children.addAll(data.map((String text) {
      return Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 13,
          ),
        ),
      );
    }).toList());

    children.add(
      SizedBox(
        child: CustomButton(
          onPressed: () {
            print('Setting Button Pressed');
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Settings'),
                  content: SingleChildScrollView(
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomButton(
                            onPressed: () {
                              print('Update Button Pressed');
                            },
                            text: 'Update',
                            color: Colors.orangeAccent,
                            textColor: Colors.white,
                            width: 15,
                            height: 10,
                          ),
                          CustomButton(
                            onPressed: () {
                              print('Delete Button Pressed');
                            },
                            text: 'Delete',
                            color: Colors.red,
                            textColor: Colors.white,
                            width: 15,
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    CustomButton(
                      onPressed: () {
                        print('modal close Pressed');
                        Navigator.of(context).pop();
                      },
                      text: 'Close',
                      color: Colors.white60,
                      textColor: Colors.black54,
                      width: 15,
                      height: 10,
                    ),
                  ],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                );
              },
            );
          },
          text: 'Set',
          color: Colors.grey,
          textColor: Colors.white,
          width: 10,
          height: 10,
        ),
      ),
    );

    return TableRow(
      children: children,
    );
  }

  static TableRow _buildTableHeaderRow(List<String> headers) {
    List<Widget> children = [];

    for (String header in headers) {
      children.add(
        TableCell(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Text(
              header,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }

    return TableRow(
      children: children,
    );
  }

  Widget _buildButton(String text, Color color, VoidCallback onPressed) {
    return CustomButton(
      onPressed: onPressed,
      text: text,
      color: color,
      textColor: Colors.white,
      width: 10,
      height: 10,
    );
  }

  Widget _buildButton2(String text, Color color, VoidCallback onPressed) {
    return CustomButton(
      onPressed: onPressed,
      text: text,
      color: color,
      textColor: Colors.white,
      width: 20,
      height: 15,
    );
  }
}

void Insert() async {
  DBHelper dbHelper = DBHelper();
  await dbHelper.initDb();
  var userList = UserList("0", "Admin", "admin", "1234");
  var db = DBHelper();
  await db.insertUser(userList);
}
