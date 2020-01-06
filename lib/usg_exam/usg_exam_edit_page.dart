import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UsgEditPage extends StatefulWidget {
  @override
  _UsgEditPageState createState() => _UsgEditPageState();
}

class UsgExam {
  String embryoPosition;
  String placentaPlacement;
  int pulse;
  int amnioticFluid;
  int npo;
  int fl;
  int abd;
  String fetalAnatomy;
}

class _UsgEditPageState extends State<UsgEditPage> {

  final _formKey = GlobalKey<FormState>();
  final _usgExam = UsgExam();

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
    return Scaffold(
        appBar: AppBar(
          title: Text('USG Exam'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
            FlatButton(
              child: Text('SAVE'),
              onPressed: () {
                final form = _formKey.currentState;
                if (form.validate()) {
                  form.save();
                  _showDialog(context);
                }
              },
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Container(
                padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                child: Builder(
                    builder: (context) => Form(
                        key: _formKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              _embryoPositionField(),
                              _placentaPlacementField(),
                              _pulseField(),
                              _npoField(),
                              _flField(),
                              _abdField(),
                              _amnioticFluidField(),
                              _fetalAnatomyField(),
                            ])))),
          ],
        ));
  }

  _embryoPositionField() {
    return TextFormField(
      decoration: formFieldDecoration(
        labelText: 'Embryo position',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter embryo position';
        }
        return null;
      },
      onSaved: (val) =>
          setState(() => _usgExam.embryoPosition = val),
    );
  }
  _placentaPlacementField() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextFormField(
        decoration: formFieldDecoration(
          labelText: 'Plancenta Placement',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter placenta placement';
          }
          return null;
        },
        onSaved: (val) =>
            setState(() => _usgExam.placentaPlacement = val),
      ),
    );
  }

  _pulseField() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextFormField(
        decoration: formFieldDecoration(
          labelText: 'Pulse',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter pulse value';
          }
          return null;
        },
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            WhitelistingTextInputFormatter.digitsOnly
          ],
        onSaved: (val) =>
            setState(() => _usgExam.pulse = val as int),
      ),
    );
  }

  _amnioticFluidField() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextFormField(
        decoration: formFieldDecoration(
          labelText: 'Amniotic fluid',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter amniotic fluid value';
          }
          return null;
        },
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            WhitelistingTextInputFormatter.digitsOnly
          ],
        onSaved: (val) =>
            setState(() => _usgExam.amnioticFluid = val as int),
      ),
    );
  }

  _npoField() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextFormField(
        decoration: formFieldDecoration(
          labelText: 'NPO',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter NPO value';
          }
          return null;
        },
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            WhitelistingTextInputFormatter.digitsOnly
          ],
        onSaved: (val) =>
            setState(() => _usgExam.npo = val as int),
      ),
    );
  }
  _flField() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextFormField(
        decoration: formFieldDecoration(
          labelText: 'FL',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter FL value';
          }
          return null;
        },
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            WhitelistingTextInputFormatter.digitsOnly
          ],
        onSaved: (val) =>
            setState(() => _usgExam.fl = val as int),
      ),
    );
  }
  _abdField() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextFormField(
        decoration: formFieldDecoration(
          labelText: 'Abd',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter Abd value';
          }
          return null;
        },
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            WhitelistingTextInputFormatter.digitsOnly
          ],
        onSaved: (val) =>
            setState(() => _usgExam.abd = val as int),
      ),
    );
  }

  _fetalAnatomyField() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextFormField(
        decoration: formFieldDecoration(
          labelText: 'Fetal anatomy',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter fetal anatomy';
          }
          return null;
        },
        onSaved: (val) =>
            setState(() => _usgExam.fetalAnatomy = val),
      ),
    );
  }



  _showDialog(BuildContext context) {
    //TODO fix showing SnackBar
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Submitting form')));
  }
}