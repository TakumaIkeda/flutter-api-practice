import 'package:flutter/material.dart';
import 'package:flutter_api_practice/views/user_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter API'),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserScreen(),
                ),
              );
            },
            child: Text(
              'Userページ',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
