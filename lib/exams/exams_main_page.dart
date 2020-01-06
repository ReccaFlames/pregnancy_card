import 'package:flutter/material.dart';

import 'control/control_exams_page.dart';
import 'other/other_exams_page.dart';

class ExamsMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ExamsMainPageState();

}

class ExamsMainPageState extends State<ExamsMainPage> {

  void _navigate(page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            CardWithHeader(
              leftText: 'Control Exams',
              rightText: '3',
              textColor: Colors.white,
              imagePath: 'images/exam-pregnancy.jpg',
              onPressed: () {
                _navigate(ControlExamsPage());
              },
            ),
            CardWithHeader(
              leftText: 'Other Exams',
              rightText: '5',
              textColor: Colors.white,
              imagePath: 'images/doctor_takes_blood_pressure.jpg',
              onPressed: () {
                _navigate(OtherExamsPage());
              },
            ),
          ],
        ),
      ),
    );
  }

}

class CardWithHeader extends StatelessWidget {

  final String leftText;
  final String rightText;
  final Color textColor;
  final String imagePath;
  final Function onPressed;


  CardWithHeader({this.leftText, this.rightText, this.textColor, this.imagePath, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            children: <Widget>[
              Image.asset(
                imagePath,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      leftText,
                      style: textStyle(),
                    ),
                    Text(
                      rightText,
                      style: textStyle(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
        ),
      ),
    );
  }

  textStyle() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: textColor,
      shadows: [
        Shadow(
          color: Colors.blueGrey,
          blurRadius: 1.0,
        ),
      ],
    );
  }

}