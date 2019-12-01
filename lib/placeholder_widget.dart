import 'package:flutter/material.dart';


class PlaceholderWidget extends StatefulWidget {

  int _id;

  PlaceholderWidget(this._id, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PlaceHolderState();

}

class _PlaceHolderState extends State<PlaceholderWidget> {

  int _count = 0;

  @override
  void initState() {
    super.initState();
    _count = PageStorage.of(context).readState(context, identifier: '${widget._id}') ?? 0;
  }

  changeCount(int val) {
    setState(() {
      _count += val;
      PageStorage.of(context).writeState(context, _count, identifier: '${widget._id}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          key: PageStorageKey(''),
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