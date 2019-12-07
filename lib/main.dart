import 'package:flutter/material.dart';
import 'home_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pregnancy Card',
      theme: ThemeData(
        primaryColor: Colors.indigo[100],
        primaryColorLight: Colors.indigo[50],
        primaryColorDark: Colors.indigo[200],
      ),
      home: Home(),
    );
  }
}