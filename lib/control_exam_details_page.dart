import 'package:flutter/material.dart';
import 'package:pregnancy_card/arc_banner_image.dart';

class ControlExamDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ControlExamDetailsState();
}

class ControlExamDetailsState extends State<ControlExamDetails> {

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
              'Control Exam 1',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '20-01-2020',
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
//            Navigator.push(
//              context,
//              MaterialPageRoute(builder: (context) => UsgEditPage()),
//            );
          },
        ),
      ],
    );

    var titleStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );

    var tableHeadStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black54,
      fontSize: 16,
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                color: Theme.of(context).backgroundColor,
              ),
              ClipPath(
                clipper: ArcClipper(),
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SafeArea(
                  child: navigation,
              ),
            ],
          ),
          Flexible(
            child: ListView(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Card(
                          margin: EdgeInsets.only(left: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Weight',
                                  style: titleStyle,
                                ),
                                Text('58 kg'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Card(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Swelling',
                                  style: titleStyle,
                                ),
                                Text('-'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Card(
                          margin: EdgeInsets.only(left: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Varicose veins',
                                  style: titleStyle,
                                ),
                                Text('-'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Card(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'RR',
                                  style: titleStyle,
                                ),
                                Text('100/60'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Card(
                          margin: EdgeInsets.only(left: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Fetal heart rate',
                                  style: titleStyle,
                                ),
                                Text('146'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Card(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Cervix',
                                  style: titleStyle,
                                ),
                                Text('200'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Card(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Other symptoms',
                                  style: titleStyle,
                                ),
                                Text('-'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Card(
                    margin: EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Blood count',
                            style: titleStyle,
                          ),
                          SizedBox(height: 8.0),
                          Table(
                            children: [
                              TableRow(children: [
                                Center(
                                  child: Text(
                                    'WBC',
                                    style: tableHeadStyle,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    'RCB',
                                    style: tableHeadStyle,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    'HGB',
                                    style: tableHeadStyle,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    'HCT',
                                    style: tableHeadStyle,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    'PLT',
                                    style: tableHeadStyle,
                                  ),
                                ),
                              ]),
                              TableRow(children: [
                                Center(child: Text('10.9')),
                                Center(child: Text('42.6')),
                                Center(child: Text('11.9')),
                                Center(child: Text('96.1')),
                                Center(child: Text('297')),
                              ]),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Card(
                    margin: EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Urine test',
                            style: titleStyle,
                          ),
                          SizedBox(height: 8.0),
                          Table(
                            children: [
                              TableRow(children: [
                                Center(
                                  child: Text(
                                    'CW',
                                    style: tableHeadStyle,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    'B',
                                    style: tableHeadStyle,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    'C',
                                    style: tableHeadStyle,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    'E',
                                    style: tableHeadStyle,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    'L',
                                    style: tableHeadStyle,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    'Bac.',
                                    style: tableHeadStyle,
                                  ),
                                ),
                              ]),
                              TableRow(children: [
                                Center(child: Text('10.2')),
                                Center(child: Text('-')),
                                Center(child: Text('-')),
                                Center(child: Text('0-1')),
                                Center(child: Text('1-2')),
                                Center(child: Text('no')),
                              ]),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Card(
                    margin: EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Recommended Exams',
                            style: titleStyle,
                          ),
                          SizedBox(height: 8.0,),
                          Text('No recomendet exams'),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Card(
                    margin: EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Recommendations',
                            style: titleStyle,
                          ),
                          SizedBox(height: 8.0,),
                          Text('No recomendations'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}