import 'package:flutter/material.dart';
import 'placeholder_widget.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;
  List<Widget> _children;


  @override
  void initState() {
    _children = [
      new PlaceholderWidget(),
      new Container(color: Colors.orangeAccent[100],),
      new PlaceholderWidget(),
    ];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pregnancy Card'),
      ),
      body: IndexedStack(
        index:_currentIndex,
        children:_children
    ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.surround_sound),
            title: new Text('USG'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.local_hospital),
            title: new Text('Exams'),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

}