
import 'dart:core';
import 'package:dreamjournal/models/dreamentryform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dreamjournal/ui/ButtonList.dart';
import 'models/dreamentryclass.dart';
import 'models/dbmanager.dart';

class AddDreamPage extends StatefulWidget{

  DreamEntryClass dreamInit;


  AddDreamPage({this.dreamInit}): super();

  @override
  _AddDreamPageState createState() => _AddDreamPageState();

}

class _AddDreamPageState extends State<AddDreamPage> {

  // final control1 = TextEditingController();
  // final control2 = TextEditingController();
  // final control3 = TextEditingController();


  final _adddreamKey = GlobalKey<FormState>();
  var dbmanager = new DBManager();


  //make a class that holds the data of the 3 controllers
  //then use the model observer to pass around instead of the text controllers

  @override
  void initState() {
    super.initState();
    widget.dreamInit = DreamEntryClass(dreamTitle: "", dreamPeople: "", dreamLocation: "");
  }


  bool _submit(GlobalKey<FormState> _formKey) {

    if (_formKey.currentState.validate()) {
      //checks if everything has been filled out properly, see dreamentrypage for validators

      //creates a new dreamEntry init, saving the data from the textfields into the dream entry instantiation.

      dbmanager.insertDream(widget.dreamInit); //see dbmanager.dart for dream

      return true;
    }
    return false;
  }

  //function that takes the dreamlist, finds the dreamentry at a specific index, and makes the dreamtitle a string and prints it out.

  //for a given index [i], we'll need to instantiate a dreamentry class and print it out on edit dream

  @override
  Widget build(BuildContext context) {
    return DreamEntryForm("New Dream Entry" , _adddreamKey , _submit,
        widget.dreamInit);
  }
}





