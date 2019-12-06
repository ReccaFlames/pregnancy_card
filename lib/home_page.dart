import 'package:flutter/material.dart';
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
          image: AssetImage('images/fetus96.png'),
        ),
      ),
      foregroundPainter: ProgressPainter(
          percentageCompletedCircleColor: Theme.of(context).primaryColor,
          defaultCircleColor: Theme.of(context).primaryColorLight,
          completedPercentage: 40,
          circleWidth: 10.0),
    );
  }

  cardHeader() {
    return Container(
      child: Row(
        children: <Widget>[
          Text(
            'Dzien dobry \nPaulina',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }

  cardContent() {
    return Container(
      height: 200.0,
      width: 200.0,
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(5.0),
      child: myCustomPaint(),
    );
  }

  cardFooter() {
    return Container(
      height: 36,
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
                      ),
                    ),
                    Text(
                      '211',
                      style: TextStyle(
                        fontSize: 18.0,
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
                      ),
                    ),
                    Text(
                      '30',
                      style: TextStyle(
                        fontSize: 18.0,
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
      child: Container(
        height: 200.0,
        padding: EdgeInsets.all(10.0),
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

  @override
  Widget build(BuildContext context) {
    return myCustomCard();
  }
}
