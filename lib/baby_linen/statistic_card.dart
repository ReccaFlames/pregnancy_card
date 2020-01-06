import 'package:flutter/material.dart';
import 'package:pregnancy_card/commons/progress_painter.dart';

class StatisticCard extends StatelessWidget {

  final String title;
  final double completedPercentage;
  final IconData icon;

  const StatisticCard({this.title, this.completedPercentage, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 1,
        margin: EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(height: 10.0,),
            _circularProgressBar(context, completedPercentage, icon),
          ],
        ),
      ),
    );
  }

  _circularProgressBar(BuildContext context, double completedPercentage, IconData icon) {
    return CustomPaint(
      child: Center(
        child: Container(
          width: 100,
          height: 100,
          child: Icon(icon, size: 40,),
        ),
      ),
      foregroundPainter: ProgressPainter(
          percentageCompletedCircleColor: Theme
              .of(context)
              .primaryColor,
          defaultCircleColor: Theme
              .of(context)
              .primaryColorLight,
          completedPercentage: completedPercentage,
          circleWidth: 5.0),
    );
  }
}