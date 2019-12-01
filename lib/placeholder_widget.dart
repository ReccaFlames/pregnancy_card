import 'package:flutter/material.dart';


class PlaceholderWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _PlaceHolderState();

}

class _PlaceHolderState extends State<PlaceholderWidget> {

  int _count = 0;

  changeCount(int val) {
    setState(() {
      _count += val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Count(
            count: _count,
            onCountChange: changeCount,
          ),
        ),
      ),
    );
  }

}

class Count extends StatelessWidget {

  final int count;
  final Function(int) onCountChange;

  Count({this.count, this.onCountChange});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            onCountChange(1);
          },
        ),
        Text("$count"),
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            onCountChange(-1);
          },
        ),
      ],
    );
  }
}