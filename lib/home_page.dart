import 'package:flutter/material.dart';
import 'package:pregnancy_card/baby_linen_page.dart';
import 'dart:ui';
import 'progress_painter.dart';

class HomePageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageViewState();
}

class HomePageViewState extends State<HomePageView> {
  myCustomPaint() {
    return CustomPaint(
      child: Center(
        child: Image(
          image: AssetImage('images/embryo200.png'),
          height: 150,
          width: 150,
        ),
      ),
      foregroundPainter: ProgressPainter(
          percentageCompletedCircleColor: Theme.of(context).primaryColor,
          defaultCircleColor: Theme.of(context).primaryColorLight,
          completedPercentage: 40,
          circleWidth: 10.0),
    );
  }

  String _user = "Paulina";

  cardHeader() {
    return Container(
      child: Row(
        children: <Widget>[
          Text(
            'Hello \n$_user',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  cardContent() {
    return Container(
      height: 300.0,
      width: 300.0,
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(5.0),
      child: myCustomPaint(),
    );
  }

  cardFooter() {
    return Container(
      height: 44,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Day',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey[600]
                      ),
                    ),
                    Text(
                      '211',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Align(
                alignment: Alignment.centerRight,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Week',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      '30',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  myCustomCard() {
    return Card(
      elevation: 5.0,
      margin: new EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 6.0),
      child: Container(
        height: 300.0,
        padding: EdgeInsets.all(15.0),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: cardContent(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: cardHeader(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: cardFooter(),
            ),
          ],
        ),
      ),
    );
  }

  final makeCard = Card(
    elevation: 5.0,
    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    child: Container(
//      decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
      child: ListTile(
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.grey))),
            child: Icon(Icons.child_friendly, size: 45,),
          ),
          title: Text(
            "Expected date of birth",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: <Widget>[
              Text("5 months 24 days")
            ],
          ),
      ),
    ),
  );

  double _value = 0.5;

  packageProgress() {
    return Card(
      elevation: 5.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: InkWell(
        onTap: _navigateBabyLinenPage,
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text.rich(
                TextSpan(
                  children: <InlineSpan>[
                    TextSpan(
                      text: "Baby linen progress "
                    ),
                    TextSpan(
                      text: "${_value*100}%",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.grey[500]),
                ),
              ),
              SizedBox(height: 10),
              LinearProgressIndicator(
                value: _value,
                backgroundColor: Theme.of(context).primaryColorLight,
                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _navigateBabyLinenPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => BabyLinenPage()),);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        myCustomCard(),
        makeCard,
        packageProgress(),
      ],
    );
  }
}
