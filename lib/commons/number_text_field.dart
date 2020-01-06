import 'package:flutter/material.dart';

class NumberTextField extends StatelessWidget{

  NumberTextField({this.decoration});

  final InputDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: decoration,
      keyboardType: TextInputType.number,
    );
  }
}