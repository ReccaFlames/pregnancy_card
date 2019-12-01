import 'package:flutter/material.dart';
import 'dart:ui';
import 'custom_progress_bar.dart';

class HomePageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageViewState();
}

class HomePageViewState extends State<HomePageView> {

//  final  = Container(
//    height: 124.0,
//    decoration: new BoxDecoration(
//      color: new Color(0xFF333366),
//      shape: BoxShape.rectangle,
//      borderRadius: new BorderRadius.circular(8.0),
//      boxShadow: <BoxShadow>[
//        new BoxShadow(
//          color: Colors.black12,
//          blurRadius: 10.0,
//          offset: new Offset(0.0, 10.0),
//        ),
//      ],
//    ),
//  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(15.0),
      child: new Center(
        child: new Column(
          children: <Widget>[
            Container(
              height: 124.0,
              decoration: new BoxDecoration(
                color: new Color(0xFF333366),
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(8.0),
                boxShadow: <BoxShadow>[
                  new BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                    offset: new Offset(0.0, 5.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

