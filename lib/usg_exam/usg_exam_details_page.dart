import 'package:flutter/material.dart';
import 'package:pregnancy_card/usg_exam/usg_exam_details_header.dart';

import 'usg_exam_details_content.dart';

class UsgDetailsPage extends StatelessWidget {

  final String _exam;
  final String _date;

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