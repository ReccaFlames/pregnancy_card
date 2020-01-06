import 'package:flutter/material.dart';
import 'package:pregnancy_card/usg_exam/usg_exam_details_header.dart';

import 'usg_exam_details_content.dart';

class UsgDetailsPage extends StatelessWidget {

  String exam;
  String date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            UsgExamHeader(exam, date),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: UsgExamDetailsContent(),
            ),
          ],
        ),
      ),
    );
  }

  UsgDetailsPage(this.exam, this.date);

}