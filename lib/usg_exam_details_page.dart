import 'package:flutter/material.dart';

import 'usg_exam_details_content.dart';
import 'usg_exam_details_header.dart';

class UsgDetailsPage extends StatelessWidget {

  String _exam;
  String _date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            UsgExamHeader(_exam, _date),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: UsgExamDetailsContent(),
            ),
          ],
        ),
      ),
    );
  }

  UsgDetailsPage(this._exam, this._date);

}