import 'package:flutter/material.dart';

import 'arc_banner_image.dart';
import 'usg_exam_edit_page.dart';

class UsgExamHeader extends StatelessWidget {

  String _exam;
  String _date;

  UsgExamHeader(this._exam, this._date);

  @override
  Widget build(BuildContext context) {

    var navigation = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          iconSize: 24,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        Column(
          children: <Widget>[
            Text(
              _exam,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              _date,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.edit, color: Colors.white),
          iconSize: 24,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UsgEditPage()),
            );
          },
        ),
      ],
    );

    return Stack(
      children: [
        ArcBannerImage('images/usg_banner.jpg'),
        SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: navigation,
              ),
            ],
          ),
        ),
      ],
    );
  }

}