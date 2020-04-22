import 'dart:core';
import 'dart:core';

import 'package:dreamjournal/models/EmoteButton.dart';
import 'package:dreamjournal/models/dreamentryform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/ButtonList.dart';
import 'models/dreamentryform.dart';
import 'models/dreamentryclass.dart';
import 'models/dbmanager.dart';
import 'models/emotebuttonbuilder.dart';

class AddDreamPage extends StatefulWidget{

  @override
  _AddDreamPageState createState() => _AddDreamPageState();

  DreamEntryClass dream_init;

  AddDreamPage({this.dream_init}): super();

}

class _AddDreamPageState extends State<AddDreamPage> {

  final control1 = TextEditingController();
  final control2 = TextEditingController();
  final control3 = TextEditingController();


  ButtonList bl= new ButtonList();   // the class in emotebuttonbuilder (why the name is different confuses me) needed to access the buttonsList


  final _adddreamKey = GlobalKey<FormState>();
  var dbmanager = new DBManager();

  List<DreamEntryClass> dreamentries;

  //make a class that holds the data of the 3 controllers
  //then use the model observer to pass around instead of the text controllers

  @override
  void initState() {
    super.initState();
    bl = new ButtonList();
    bl.init();
  }


  bool _submit(GlobalKey<FormState> _formKey) {

    //couldn't find a way to easily cast the boolean to int! :(
    int booltoint(bool_result) {
      if (bool_result == true){
        return 1;
      } else{
        return 0;
      }
    }

    if (_formKey.currentState.validate()) {
      //checks if everything has been filled out properly, see dreamentrypage for validators

      //creates a new dreamEntry init, saving the data from the textfields into the dream entry instantiation.

      widget.dream_init = new DreamEntryClass(
        dreamPeople: control3.text,
        dreamTitle: control1.text,
        dreamLocation: control2.text,
        isHappy: 1
          //GET BUTTONLIST 
      );

      dbmanager.insertDream(widget.dream_init); //see dbmanager.dart for dream

      showdreams(); //see below, just a work in progress.

      return true;
    }
    return false;
  }

  //function that takes the dreamlist, finds the dreamentry at a specific index, and makes the dreamtitle a string and prints it out.

  //for a given index [i], we'll need to instantiate a dreamentry class and print it out on edit dream

  Future <void> showdreams() async {
    List<DreamEntryClass> dreamlisted = await dbmanager.dreamList();
    dreamentries = dreamlisted;

    print(dreamentries.length);
  }

  @override
  Widget build(BuildContext context) {
    return DreamEntryForm("New Dream Entry" , _adddreamKey , _submit,
        control1, control2, control3, widget.dream_init); //,bl.getButtonList());
  }
}





