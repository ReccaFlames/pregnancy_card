import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OtherExamsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OtherExamsPageState();
}

class OtherExamsPageState extends State<OtherExamsPage> {

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
                title: Text("Other Exams",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                background: Image.asset(
                  'images/doctor_takes_blood_pressure.jpg',
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
          _createOtherExamPicker(context).then((onValue) {
            setState(() {
              if(onValue != null) {
                dates.add(DateFormat.yMMMd().format(new DateTime(2019, 10, 25)));
              }
            });
          });
        },
      ),
    );
  }

  final dates = [DateFormat.yMMMd().format(new DateTime(2019, 08, 22)),
    DateFormat.yMMMd().format(new DateTime(2019, 09, 23)),
    DateFormat.yMMMd().format(new DateTime(2019, 10, 24)),
    DateFormat.yMMMd().format(new DateTime(2019, 10, 25)),
    DateFormat.yMMMd().format(new DateTime(2019, 10, 26)),
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
              print('tapped');
            },
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(dates[index]),
              ],
            ),
            title: Text(
              'Exam ${++index}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Icon(Icons.check_circle_outline, color: Colors.green, size: 24,),
          ),
        );
      },
    );
  }

  _createOtherExamPicker(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            height: 220,
            child: Container(
              child: _buildBottomNavigationMenu(),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10),
                ),
              ),
            ),
          );
        });
  }

  final otherExams = <String>['One', 'Two', 'Free', 'Four', 'Five', 'Six'];

  _buildBottomNavigationMenu() {
    return Column(
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            itemCount: otherExams.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(otherExams[index]),
                onTap: () {
                  Navigator.of(context).pop(otherExams[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
