import 'package:dreamjournal/models/dreamentrypage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/dreamentrypage.dart';
import 'models/dreamentry.dart';
import 'models/dbmanager.dart';

class DreamEntryPage extends StatefulWidget{

  @override
  _DreamEntryPageState createState() => _DreamEntryPageState();

}

class _DreamEntryPageState extends State<DreamEntryPage> {

  final control1 = TextEditingController();
  final control2 = TextEditingController();
  final control3 = TextEditingController();

  final _adddreamKey = GlobalKey<FormState>();

  //make a class that holds the data of the 3 controllers
  //then use the model observer to pass around instead of the text controllers

  bool _submit(GlobalKey<FormState> _formKey) {

    var dbmanager = new DBManager();

    dbmanager.openDB();

    if (_formKey.currentState.validate()) {
      //checks if everything has been filled out properly, see dreamentrypage for validators

      _formKey.currentState.save();
      //not sure if this .save() is needed, or what it does


      //creates a new dreamEntry init, saving the data from the textfields into the dream entry instantiation.
      DreamEntry dream_submission = new DreamEntry(isHappy: true,
          dreamTitle: control1.toString(),
          dreamLocation: control2.toString(),
          dreamPeople: control3.toString());

      dbmanager.insertDream(dream_submission); //see dbmanager.dart for dream

      dbmanager.dreamList(); //should spit out a list of the dreams (?)

      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return DreamEntryForm("New Dream Entry" , _adddreamKey , _submit,
        control1, control2, control3);
  }
}





