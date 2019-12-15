import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OtherExamsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OtherExamsPageState();
}

class OtherExamsPageState extends State<OtherExamsPage> {

  _createNewExamDialog(BuildContext context) {
    return showDialog(context: context, builder: (context) {
        String dropdownValue = 'One';
        return AlertDialog(
          content: DropdownButton<String>(
            value: dropdownValue,
            iconSize: 24,
            elevation: 16,
            style: TextStyle(
                color: Colors.black,
            ),
            underline: Container(
              height: 2,
              color: Theme.of(context).primaryColorDark,
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>['One', 'Two', 'Free', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            })
                .toList(),
          ),
          actions: <Widget>[
            MaterialButton(
              child: Text('Cancel',),
              onPressed: () {
                Navigator.of(context).pop();
              }
            ),
            MaterialButton(
              child: Text('Submit',),
              onPressed: () {
                Navigator.of(context).pop(dropdownValue);
              }
            ),
          ],
        );
      }
    );
  }

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
          _createNewExamDialog(context).then((onValue) {
            setState(() {
              dates.add(DateFormat.yMMMd().format(new DateTime(2019, 10, 25)));
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
}
