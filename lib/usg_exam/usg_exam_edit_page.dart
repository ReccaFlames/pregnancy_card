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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Usg Exam')),
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
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 16.0),
                                  child: RaisedButton(
                                    color: Theme.of(context).primaryColor,
                                      onPressed: () {
                                        final form = _formKey.currentState;
                                        if (form.validate()) {
                                          form.save();
                                          _showDialog(context);
                                        }
                                      },
                                      child: Text('Save'))),
                            ])))),
          ],
        ));
  }

  _embryoPositionField() {
    return TextFormField(
      decoration:
      InputDecoration(labelText: 'Embryo position'),
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
    return TextFormField(
      decoration:
      InputDecoration(labelText: 'Plancenta Placement'),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter placenta placement';
        }
        return null;
      },
      onSaved: (val) =>
          setState(() => _usgExam.placentaPlacement = val),
    );
  }

  _pulseField() {
    return TextFormField(
      decoration:
      InputDecoration(labelText: 'Pulse'),
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
    );
  }

  _amnioticFluidField() {
    return TextFormField(
      decoration:
      InputDecoration(labelText: 'Amniotic fluid'),
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
    );
  }

  _npoField() {
    return TextFormField(
      decoration:
      InputDecoration(labelText: 'NPO'),
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
    );
  }
  _flField() {
    return TextFormField(
      decoration:
      InputDecoration(labelText: 'FL'),
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
    );
  }
  _abdField() {
    return TextFormField(
      decoration:
      InputDecoration(labelText: 'Abd'),
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
    );
  }

  _fetalAnatomyField() {
    return TextFormField(
      decoration:
      InputDecoration(labelText: 'Fetal anatomy'),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter fetal anatomy';
        }
        return null;
      },
      onSaved: (val) =>
          setState(() => _usgExam.fetalAnatomy = val),
    );
  }



  _showDialog(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Submitting form')));
  }
}