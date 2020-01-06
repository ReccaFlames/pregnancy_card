import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pregnancy_card/exams/exams_main_page.dart';
import 'package:pregnancy_card/user_profile/user_profile_page.dart';
import '../usg_exam/usg_main_widget.dart';
import 'home_page.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>_HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;
  List<Widget> _children;

  @override
  void initState() {
    _children = [
      new HomePageView(),
      new UsgMainPage(),
      new ExamsMainPage(),
    ];
    super.initState();
  }

  final f = new DateFormat.yMMMd().format(new DateTime.now());

  createAvatar() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserProfilePage()),
        );
      },
      child: new Container(
        width: 40.0,
        height: 40.0,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new NetworkImage('https://i2.wp.com/polskaplyta-polskamuzyka.pl/wp-content/uploads/2019/09/SANAH.jpg?resize=960%2C960'),
            fit: BoxFit.cover,
          ),
          borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500],
              blurRadius: 4.0, // has the effect of softening the shadow
              spreadRadius: 3.0, // has the effect of extending the shadow
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$f \nToday', style: TextStyle(color: Colors.grey[600]),),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: createAvatar(),
          ),
        ],
      ),
      body: IndexedStack(
        index:_currentIndex,
        children:_children
    ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 15.0,
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