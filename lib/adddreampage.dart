import 'package:dreamjournal/models/dreamentrypage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/dreamentrypage.dart';

class DreamEntryPage extends StatefulWidget{

  @override
  _DreamEntryPageState createState() => _DreamEntryPageState();

}

class _DreamEntryPageState extends State<DreamEntryPage> {
  final _formKey = GlobalKey<FormState>();

  //final _dreamentry = DreamEntry(); //for when we start saving responses to the forms, etc

  bool _submit(GlobalKey<FormState> _formKey) {
    if (_formKey.currentState.validate()) {
      //checks if everything has been filled out properly, see dreamentrypage for validators
      _formKey.currentState.save();
      return true;
    }
    return false;
  }

  //instantiating DreamEntryForm as new dream entry page

  @override
  Widget build(BuildContext context) {
    return DreamEntryForm("New Dream Entry" , _formKey , _submit);
  }
}





