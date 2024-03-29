import 'package:flutter/material.dart';

import '../DB/DBHelper.dart';
import '../DB/userList.dart';
import '../component/Button.dart';
import '../routes/router.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  late List<UserList> users = [];

  @override
  void initState() {
    super.initState();
    getAll();
    getUsersFromDB();
  }

  void getUsersFromDB() async {
    DBHelper dbHelper = DBHelper();
    await dbHelper.initDb();
    List<UserList> userList = await dbHelper.getAll();
    setState(() {
      users = userList;
    });
  }

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
        title: const Text('AccountMangement'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              print('Refresh Button Pressed');
              setState(() {
                getUsersFromDB();
              });
            },
          ),
        ],
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
                        hintText: 'Enter user',
                        labelText: 'Search',
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(width: 3, color: Colors.greenAccent),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  _buildButton('Search', Colors.blue, () async {
                    print("Search Button Pressed");
                    String search = _searchController.text;
                    _searchController.clear();
                    print('search: $search');
                    List<UserList> result = await getUser(search);
                    setState(() {
                      users = result;
                    });
                  }),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return _buildUserRow(users[index], context);
                },
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton2('Insert', Colors.blue, () {
                      print('Insert Button Pressed');
                      clearInput();
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Insert'),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
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
                                const SizedBox(height: 10),
                                TextField(
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
                                const SizedBox(height: 10),
                                TextField(
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
                                  String name = _nameController.text;
                                  String user = _usernameController.text;
                                  String password = _passwordController.text;
                                  clearInput();
                                  insert(name, user, password);
                                  print('input{ name: `$name`, user: `$user`, password: `$password` }');
                                  Navigator.of(context).pop();
                                  setState(() {
                                    getAll();
                                    getUsersFromDB();
                                  });
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

  Widget _buildUserRow(UserList user, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              user.name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              user.user,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              user.password,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomButton(
                onPressed: () {
                  print('Setting Button Pressed for ID: ${user.id}');
                  _nameController.text = user.name;
                  _usernameController.text = user.user;
                  _passwordController.text = user.password;
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Setting'),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
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
                            const SizedBox(height: 10),
                            TextField(
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
                            const SizedBox(height: 10),
                            TextField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 3, color: Colors.greenAccent),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          CustomButton(
                            onPressed: () {
                              print('Delete Button Pressed');
                              delete(user.id);
                              Navigator.of(context).pop();
                              setState(() {
                                getUsersFromDB();
                              });
                            },
                            text: 'Delete',
                            color: Colors.red,
                            textColor: Colors.white,
                            width: 15,
                            height: 10,
                          ),
                          CustomButton(
                            onPressed: () {
                              print('modal close Pressed');
                              Navigator.of(context).pop();
                            },
                            text: 'Cancel',
                            color: Colors.orangeAccent,
                            textColor: Colors.white,
                            width: 15,
                            height: 10,
                          ),
                          CustomButton(
                            onPressed: () {
                              print('modal update Pressed');
                              String name = _nameController.text;
                              String username = _usernameController.text;
                              String password = _passwordController.text;
                              update(user.id, name, username, password);
                              print('Updated { name: `$name`, username: `$username`, password: `$password` }');
                              Navigator.of(context).pop();
                              setState(() {
                                getUsersFromDB();
                              });
                            },
                            text: 'Update',
                            color: Colors.blue,
                            textColor: Colors.white,
                            width: 15,
                            height: 10,
                          ),
                        ],
                      );
                    },
                  );
                },
                text: 'set',
                color: Colors.grey,
                textColor: Colors.white,
                width: 15,
                height: 10,
              ),
            ),
          ),
        ],
      ),
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

  void clearInput() {
    _nameController.clear();
    _usernameController.clear();
    _passwordController.clear();
  }
}

void insert(String name, String user, String password) async {
  DBHelper dbHelper = DBHelper();
  await dbHelper.initDb();
  UserList userList = UserList(0, name, user, password);
  await dbHelper.insertUser(userList);
}

void update(int id, String name, String user, String password) async {
  DBHelper dbHelper = DBHelper();
  await dbHelper.initDb();
  UserList userList = UserList(id, name, user, password);
  await dbHelper.updateUser(userList);
}

void delete(int id) async {
  DBHelper dbHelper = DBHelper();
  await dbHelper.initDb();
  await dbHelper.delete(id);
}

void getAll() async {
  DBHelper dbHelper = DBHelper();
  await dbHelper.initDb();
  List<UserList> users = await dbHelper.getAll();

  print('User data:');
  for (var user in users) {
    print('ID: ${user.id}, Name: ${user.name}, Username: ${user.user}, Password: ${user.password}');
  }
}

Future<List<UserList>> getUser(String user) async {
  DBHelper dbHelper = DBHelper();
  await dbHelper.initDb();
  List<UserList> users = await dbHelper.getUser(user);

  print('getUser:');
  for (var user in users) {
    print('ID: ${user.id}, Name: ${user.name}, Username: ${user.user}, Password: ${user.password}');
  }
  return users;
}

void clearAllData() async {
  DBHelper dbHelper = DBHelper();
  await dbHelper.initDb();
  await dbHelper.clearAll();
}