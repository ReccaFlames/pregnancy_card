import 'package:flutter/material.dart';
import 'package:pregnancy_card/baby_linen/product_category.dart';
import 'package:pregnancy_card/baby_linen/statistic_card.dart';

class BabyLinenStatisticsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BabyLinenStatisticsPageState();
}

class BabyLinenStatisticsPageState extends State<BabyLinenStatisticsPage> {
  List<ProductCategory> productsCategories = [
    new ProductCategory(
        name: 'Clothes', completePercentage: 10, icon: Icons.spa),
    new ProductCategory(
        name: 'Bath & care', completePercentage: 20, icon: Icons.child_care),
    new ProductCategory(
        name: 'Feed', completePercentage: 30, icon: Icons.fastfood),
    new ProductCategory(
        name: 'Sleep', completePercentage: 40, icon: Icons.hotel),
    new ProductCategory(
        name: 'Others', completePercentage: 60, icon: Icons.child_friendly),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Baby Linen Dashboard'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GridView.builder(
        itemCount: productsCategories.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return StatisticCard(
            title: productsCategories[index].name,
            completedPercentage: productsCategories[index].completePercentage,
            icon: productsCategories[index].icon,
          );
        },
      ),
    );
  }
}
