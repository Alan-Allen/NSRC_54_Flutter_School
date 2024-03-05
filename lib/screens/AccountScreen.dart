import 'package:flutter/material.dart';
import 'package:password5_54/component/Button.dart';
import 'package:password5_54/component/common_drawer.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: CommonDrawer.getDrawer(context),
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
                _buildTableRow(['Name', "User", 'Password'], isHeader: true),
                _buildTableRow(['Admin', 'admin', '1234']),
                _buildTableRow(['Alan', 'Alan_0811', '4321']),
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
                    }),
                    _buildButton2('Input', Colors.green, () {
                      print('Input Button Pressed');
                    }),
                    _buildButton2('Output', Colors.redAccent, () {
                      print('Output Button Pressed');
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

  static TableRow _buildTableRow(List<String> data, {bool isHeader = false}) {
    return TableRow(
      children: data.map((String text) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
        );
      }).toList(),
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
      width: 40,
      height: 15,
    );
  }
}