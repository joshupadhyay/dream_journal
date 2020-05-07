import 'dart:core';
import 'package:DreamJournal/models/dreamentryform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/dreamentryclass.dart';
import '../models/dbmanager.dart';

class AddDreamPage extends StatefulWidget {
  DreamEntryClass dreamInit; //initialize empty dream to populate for submission

  AddDreamPage({this.dreamInit}) : super();

  @override
  _AddDreamPageState createState() => _AddDreamPageState();
}

class _AddDreamPageState extends State<AddDreamPage> {
  final _adddreamKey = GlobalKey<FormState>();
  var dbmanager = new DBManager();

  @override
  Widget build(BuildContext context) {
    return DreamEntryForm(
        "New Dream Entry", _adddreamKey, _submit, widget.dreamInit);
  }

  @override
  void initState() {
    super.initState();
    widget.dreamInit =
        DreamEntryClass(dreamTitle: "", dreamPeople: "", dreamLocation: ""); //
  }

  bool _submit(GlobalKey<FormState> _formKey) {
    if (_formKey.currentState.validate()) {
      //checks if everything has been filled out properly, see dreamentrypage for validation

      dbmanager.insertDream(widget.dreamInit); //see dbmanager.dart for dream

      return true; //bool output for dreamentryform
    }
    return false;
  }
}
