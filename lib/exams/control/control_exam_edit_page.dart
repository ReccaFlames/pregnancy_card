import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pregnancy_card/commons/number_text_field.dart';
import 'package:pregnancy_card/commons/roundedButton.dart';

class ControlExamEditPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ControlExamEditPageState();
}

class ControlExamEditPageState extends State<ControlExamEditPage> {
  String _selectedItem = '--/--';
  bool _isSwitched = true;
  bool _isSwitched2 = true;
  bool _isSwitched3 = false;
  DateTime _examDate = DateTime.now();

  formFieldDecoration({String labelText}) {
    return InputDecoration(
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: Colors.black)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: Colors.black)),
      labelText: labelText,
    );
  }

  @override
  Widget build(BuildContext context) {
    switchTile({isSwitched, title}) {
      return ListTile(
        title: Text(title),
        trailing: Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
            });
          },
          activeTrackColor: Theme.of(context).primaryColorLight,
          activeColor: Theme.of(context).primaryColorDark,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Control Exam'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          FlatButton(
            child: Text('SAVE'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: IconButton(
                  icon: Icon(Icons.date_range), onPressed: _createDatePicker),
              title: Text('Exam Date'),
              trailing: Text(DateFormat.yMMMd().format(_examDate)),
            ),
            NumberTextField(
              decoration: formFieldDecoration(
                labelText: 'Weight',
              ),
            ),
            switchTile(isSwitched: _isSwitched, title: 'Swelling'),
            switchTile(isSwitched: _isSwitched2, title: 'Vericose veins'),
            //RR
            rrTile(),
            NumberTextField(
              decoration: formFieldDecoration(
                labelText: 'Fetal heart rate',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: NumberTextField(
                decoration: formFieldDecoration(
                  labelText: 'Cervix',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextFormField(
                decoration: formFieldDecoration(
                  labelText: 'Other symptoms',
                ),
              ),
            ),
            //Blood count
            ExpansionTile(
              title: Text('Blood count'),
              children: <Widget>[
                NumberTextField(
                  decoration: formFieldDecoration(
                    labelText: 'WBC',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: NumberTextField(
                    decoration: formFieldDecoration(
                      labelText: 'RBC',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: NumberTextField(
                    decoration: formFieldDecoration(
                      labelText: 'HGB',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: NumberTextField(
                    decoration: formFieldDecoration(
                      labelText: 'HCT',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: NumberTextField(
                    decoration: formFieldDecoration(
                      labelText: 'PLT',
                    ),
                  ),
                ),
              ],
            ),
            //Urine test
            ExpansionTile(
              title: Text('Urine test'),
              children: <Widget>[
                NumberTextField(
                  decoration: formFieldDecoration(
                    labelText: 'CW',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: NumberTextField(
                    decoration: formFieldDecoration(
                      labelText: 'B',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: NumberTextField(
                    decoration: formFieldDecoration(
                      labelText: 'C',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: NumberTextField(
                    decoration: formFieldDecoration(
                      labelText: 'E',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: NumberTextField(
                    decoration: formFieldDecoration(
                      labelText: 'L',
                    ),
                  ),
                ),
                switchTile(isSwitched: _isSwitched3, title: 'Bac.'),
              ],
            ),
            TextFormField(
              minLines: 5,
              maxLines: 10,
              decoration: formFieldDecoration(
                labelText: 'Recommended exams',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextFormField(
                minLines: 5,
                maxLines: 10,
                decoration: formFieldDecoration(
                  labelText: 'Recommendations',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  rrTile() {
    return ListTile(
      title: Text('RR'),
      trailing: FlatButton(
        child: Text(_selectedItem),
        onPressed: _createRrPicker,
      ),
    );
  }

  void _createRrPicker() {
    showModalBottomSheet(
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

  _buildBottomNavigationMenu() {
    int _currentValue = 0;
    int _currentValue2 = 0;
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NumberPicker.integer(
                initialValue: _currentValue,
                minValue: 0,
                maxValue: 500,
                onChanged: (newValue) =>
                    setState(() => _currentValue = newValue)),
            Text(
              '/',
              style: TextStyle(fontSize: 30),
            ),
            NumberPicker.integer(
                initialValue: _currentValue2,
                minValue: 0,
                maxValue: 500,
                onChanged: (newValue) =>
                    setState(() => _currentValue2 = newValue)),
          ],
        ),
        FlatButton(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0),
          ),
          color: Theme.of(context).primaryColorDark,
          child: Text(
            'Select',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          onPressed: () => setState(() {
            Navigator.pop(context);
            _selectedItem = '$_currentValue/$_currentValue2';
          }),
        ),
      ],
    );
  }

  void _createDatePicker() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            height: 260,
            child: Container(
              child: _buildDatePickerContent(),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10),
                ),
              ),
            ),
          );
        });
  }

  _buildDatePickerContent() {
    DateTime _selectedDate;
    return Column(
      children: <Widget>[
        Container(
          margin: new EdgeInsets.only(top: 8),
          color: Colors.amber,
          height: 200,
          child: CupertinoDatePicker(
            initialDateTime: _examDate,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (newDateTime) {
              _selectedDate = newDateTime;
            },
          ),
        ),
        RoundedFlatButton(
          displayedText: 'Select',
          onPressed: () => setState(() {
            Navigator.pop(context);
            _examDate = _selectedDate;
          }),
        ),
      ],
    );
  }
}
