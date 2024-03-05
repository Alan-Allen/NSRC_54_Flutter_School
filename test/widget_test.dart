import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:password5_54/main.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' show join;

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Database test', (WidgetTester tester) async {
    // 打开内存数据库
    final database = await openDatabase(
      join(await getDatabasesPath(), 'test_database.db'),
      onCreate: (db, version) {
        // 创建数据库表
        return db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, email TEXT)',
        );
      },
      version: 1,
    );

    // 插入测试数据
    await database.insert(
      'users',
      {'id': 1, 'name': 'John Doe', 'email': 'john@example.com'},
    );

    // 构建测试页面
    await tester.pumpWidget(MaterialApp(
      home: MyHomePage(database: database), // 在这里传递数据库
    ));

    // 检查页面是否显示了 John Doe 的姓名
    expect(find.text('John Doe'), findsOneWidget);

    // 关闭数据库
    await database.close();
  });
}

class MyHomePage extends StatelessWidget {
  final Database database;

  const MyHomePage({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Home Page'),
      ),
      body: const Center(
        child: Text('Home Page Content'),
      ),
    );
  }
}