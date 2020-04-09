import 'package:dreamjournal/models/dreamentrypage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/dreamentrypage.dart';
import 'models/dreamentry.dart';

class DreamEntryPage extends StatefulWidget{

  @override
  _DreamEntryPageState createState() => _DreamEntryPageState();

}

class _DreamEntryPageState extends State<DreamEntryPage> {

  DreamEntry adddream = new DreamEntry(true);

  final _adddreamKey = GlobalKey<FormState>();

  //final _dreamentry = DreamEntry(); //for when we start saving responses to the forms, etc

  bool _submit(GlobalKey<FormState> _formKey) {
    if (_formKey.currentState.validate()) {
      //checks if everything has been filled out properly, see dreamentrypage for validators

      _formKey.currentState.save();
      return true;
    }
    return false;
  }


  @override
  Widget build(BuildContext context) {
    return DreamEntryForm("New Dream Entry" , _adddreamKey , _submit);
  }
}





