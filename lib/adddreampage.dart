import 'dart:core';
import 'dart:core';

import 'package:dreamjournal/models/dreamentrypage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/ButtonList.dart';
import 'models/dreamentrypage.dart';
import 'models/dreamentry.dart';
import 'models/dbmanager.dart';
import 'models/emotebuttonbuilder.dart';

class DreamEntryPage extends StatefulWidget{

  @override
  _DreamEntryPageState createState() => _DreamEntryPageState();

}

class _DreamEntryPageState extends State<DreamEntryPage> {

  final control1 = TextEditingController();
  final control2 = TextEditingController();
  final control3 = TextEditingController();

  final _adddreamKey = GlobalKey<FormState>();

  var dbmanager = new DBManager();

  List<DreamEntry> dreamentries;

  //make a class that holds the data of the 3 controllers
  //then use the model observer to pass around instead of the text controllers


  bool _submit(GlobalKey<FormState> _formKey) {

    dbmanager.openDB();

    if (_formKey.currentState.validate()) {
      //checks if everything has been filled out properly, see dreamentrypage for validators

      _formKey.currentState.save();
      //not sure if this .save() is needed, or what it does


      //creates a new dreamEntry init, saving the data from the textfields into the dream entry instantiation.
      DreamEntry dream_submission = new DreamEntry(isHappy: 1,
          dreamTitle: control1.toString(),
          dreamLocation: control2.toString(),
          dreamPeople: control3.toString());



     dbmanager.insertDream(dream_submission); //see dbmanager.dart for dream

      showdreams(); //see below, just a work in progress.




      return true;
    }
    return false;
  }

  //function that takes the dreamlist, finds the dreamentry at a specific index, and makes the dreamtitle a string and prints it out.

  //for a given index [i], we'll need to instantiate a dreamentry class and print it out on edit dream

  Future <void> showdreams() async {
    List<DreamEntry> dreamlisted = await dbmanager.dreamList();
    dreamentries = dreamlisted;
  }

ButtonList bl;   // the class in emotebuttonbuilder (why the name is different confuses me) needed to access the buttonsList

  @override
  Widget build(BuildContext context) {
    return DreamEntryForm("New Dream Entry" , _adddreamKey , _submit,
        control1, control2, control3, bl.buttonsList);
  }
}





