import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pregnancy_card/exams/control/control_exam_details_page.dart';

class ControlExamsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ControlExamsPageState();
}

class ControlExamsPageState extends State<ControlExamsPage> {
  @override
  Widget build(BuildContext context) {

    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("Control Exams",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                background: Image.asset(
                  'images/exam-pregnancy.jpg',
                  width: screenWidth,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: _examsListView(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorDark,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            dates.add('--,--,--');
          });
        },
      ),
    );
  }

  final dates = [DateFormat.yMMMd().format(new DateTime(2019, 08, 22)),
    DateFormat.yMMMd().format(new DateTime(2019, 09, 23)),
    DateFormat.yMMMd().format(new DateTime(2019, 10, 24))
  ];

  _examsListView() {
    return ListView.builder(
      itemCount: dates.length,
      itemBuilder: (context, index) {
        return Dismissible(
          direction: DismissDirection.endToStart,
          key: UniqueKey(),
          onDismissed: (DismissDirection direction) {
            setState(() {
              dates.removeAt(index);
            });
          },
          secondaryBackground: Container(
            child: Center(
              child: Text(
                'Delete',
                style: TextStyle(color: Colors.white),
              ),
            ),
            color: Colors.redAccent,
          ),
          background: Container(),
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ControlExamDetails()),
              );
            },
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(dates[index]),
              ],
            ),
            title: Text(
              'Control Exam ${++index}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Icon(Icons.info_outline, size: 24,),
          ),
        );
      },
    );
  }
}
