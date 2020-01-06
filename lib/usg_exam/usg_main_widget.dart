import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'usg_exam_details_page.dart';

class UsgMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UsgMainPageState();
}

class _UsgMainPageState extends State<UsgMainPage> {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }

  Widget _myListView(BuildContext context) {

    final dates = [DateFormat.yMMMd().format(new DateTime(2019, 08, 22)),
      DateFormat.yMMMd().format(new DateTime(2019, 09, 23)),
      DateFormat.yMMMd().format(new DateTime(2019, 10, 24))
    ];

    void _navigateDetailsPage(index) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UsgDetailsPage('USG Exam $index', dates[--index])),
      );
    }

    return ListView.builder(
      itemCount: dates.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 1,
          child: ListTile(
            onTap: () {
              _navigateDetailsPage(index);
            },
            leading: Icon(Icons.track_changes, size: 45,),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(dates[index]),
              ],
            ),
            title: Text(
              'USG Exam ${++index}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Icon(Icons.keyboard_arrow_right, size: 30,),
          ),
        );
      },
    );
  }
}