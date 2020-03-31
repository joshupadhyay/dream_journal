import 'package:dreamjournal/EmoteButton.dart';
import 'package:dreamjournal/models/dreamentryform.dart';
import 'package:dreamjournal/recentdreams.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'emotebuttonbuilder.dart';
import 'models/dreamentryform.dart';
import 'package:intl/intl.dart';




//TODO: probably nest this function somewhere, looks weird just sitting out here

class DreamEntryPage extends StatefulWidget{

  @override
  _DreamEntryPageState createState() => _DreamEntryPageState();

}

class _DreamEntryPageState extends State<DreamEntryPage> {
  final _formKey = GlobalKey<FormState>();
  //DreamEntryPage addDream = new DreamEntryPage("Add Entry", _formKey);
  //final _dreamentry = DreamEntry(); //for when we start saving responses to the forms, etc

  bool _submit(GlobalKey<FormState> _formKey) {
    if (_formKey.currentState.validate()) {
      //checks if everything has been filled out properly
      _formKey.currentState.save();
      return true;
    }
    return false;
  }


  @override
  Widget build(BuildContext context) {
    return DreamEntryForm("New Dream Entrry" , _formKey , _submit);
  }
}
/*Handles all the text fields, the question appearances, */




