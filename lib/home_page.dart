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
          defaultCircleColor: Colors.amber,
          percentageCompletedCircleColor: Colors.green,
          completedPercentage: 40,
          circleWidth: 10.0),
    );
  }

  myCustomCard() {
    return Card(
      elevation: 5.0,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Dzien dobry \nPaulina',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            Container(
              height: 200.0,
              width: 200.0,
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.all(5.0),
              child: myCustomPaint(),
            ),
            Row(
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
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            '211',
                            style: TextStyle(
                              fontSize: 20.0,
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
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: myCustomCard(),
    );
  }

}