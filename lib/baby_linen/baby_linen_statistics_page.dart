import 'package:flutter/material.dart';
import 'package:pregnancy_card/baby_linen/statistic_card.dart';

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
          StatisticCard(
            title: 'Clothes',
            completedPercentage: 10,
            icon: Icons.spa,
          ),
          StatisticCard(
              title: 'Bath & care',
              completedPercentage: 20,
              icon: Icons.child_care),
          StatisticCard(
              title: 'Feed',
              completedPercentage: 30,
              icon: Icons.fastfood
          ),
          StatisticCard(
              title: 'Sleep',
              completedPercentage: 40,
              icon: Icons.hotel
          ),
          StatisticCard(
              title: 'Others',
              completedPercentage: 60,
              icon: Icons.child_friendly),
        ],
      ),
    );
  }
}
