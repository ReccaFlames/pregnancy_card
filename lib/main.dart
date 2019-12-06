import 'package:flutter/material.dart';
import 'home_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pregnancy Card',
      theme: ThemeData(
        primaryColor: Colors.pink[100],
        primaryColorLight: Colors.pink[50],
        primaryColorDark: Colors.pink[200],
      ),
      home: Home(),
    );
  }
}