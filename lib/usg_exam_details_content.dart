import 'package:flutter/material.dart';

class UsgExamDetailsContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UsgExamDetailsContentState();

}

class _UsgExamDetailsContentState extends State<UsgExamDetailsContent> {

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    Map<String, String> details = {
      'Embryo position': 'Lorem ipsum dolor sit amet.',
      'Placement of the placenta': 'Consectetur adipiscing elit.',
      'Pulse':'90[bpm]',
      'Amniotic fluid':'5[l]',
      'NPO':'300',
      'FL':'200',
      'Abd':'100',
      'Fetal anatomi':'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    };


    buildListItem(index) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              details.keys.toList()[index],
              style: textTheme.subhead.copyWith(fontSize: 18.0),
            ),
            SizedBox(height: 5.0),
            Text(
              details.values.toList()[index],
              style: textTheme.body1.copyWith(
                color: Colors.black45,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        buildListItem(0),
        buildListItem(1),
        buildListItem(2),
        buildListItem(3),
        buildListItem(4),
        buildListItem(5),
        buildListItem(6),
        buildListItem(7),
      ],
    );
  }
}