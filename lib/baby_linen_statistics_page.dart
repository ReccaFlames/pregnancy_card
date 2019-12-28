import 'package:flutter/material.dart';
import 'package:pregnancy_card/progress_painter.dart';

class BabyLinenStatisticsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BabyLinenStatisticsPageState();
}

class BabyLinenStatisticsPageState extends State<BabyLinenStatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Baby Linen Dashboard'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          statisticCard('Clothes', 10, Icons.spa),
          statisticCard('Bath & care', 20, Icons.child_care),
          statisticCard('Feed', 30, Icons.fastfood),
          statisticCard('Sleep', 40, Icons.hotel),
          statisticCard('Others', 60, Icons.child_friendly),
        ],
      ),
    );
  }

  statisticCard(String title, double completedPercentage, IconData icon) {
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
            myCustomPaint(completedPercentage, icon),
          ],
        ),
      ),
    );
  }

  myCustomPaint(double completedPercentage, IconData icon) {
    return CustomPaint(
      child: Center(
        child: Container(
          width: 100,
          height: 100,
          child: Icon(icon, size: 40,),
        ),
      ),
      foregroundPainter: ProgressPainter(
          percentageCompletedCircleColor: Theme.of(context).primaryColor,
          defaultCircleColor: Theme.of(context).primaryColorLight,
          completedPercentage: completedPercentage,
          circleWidth: 5.0),
    );
  }

}
