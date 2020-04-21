import 'package:dreamjournal/models/dreamentrypage.dart';
import 'package:flutter/material.dart';
import 'models/ButtonList.dart';
import 'models/dreamentry.dart';
import 'models/dbmanager.dart';


class EditDreamPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>_EditDreamPageState();
}

class _EditDreamPageState extends State<EditDreamPage>{

  DBManager dbmanager = DBManager();
  List<DreamEntry> dreamentries;

  // List<DreamEntry> dreamentries;
  Future data;

  @override
  void initState() {
    super.initState();
    data = showdreams();
  }

  Future <void> showdreams() async {
    dbmanager = this.dbmanager;
    List<DreamEntry> dreamlisted = await dbmanager.dreamList();
    dreamentries=dreamlisted;
  }

//  final control1_dreamTitle = dreamentries[0].dreamTitle.toString();

  final _editingKey = new GlobalKey<FormState>();

  final control1 = TextEditingController(text: "Title");
  final control2 = TextEditingController(text: "Location");
  final control3 = TextEditingController(text: "People");




  bool _submit(GlobalKey<FormState> _formKey) {
    if (_formKey.currentState.validate()) {
      //checks if everything has been filled out properly
      _formKey.currentState.save();

      return true;
    }
    return false;
  }

  //need to first call a function that grabs the dream title from the selected RecentDreams page
  //so each dreamcard needs to return a dreamtitle, onPressed
  //then the dreamtitle needs to be passed into this page, so we can call "update dream"
  //then we instantiate a dreamentry object with those parameters
  //then send data to the textediting controller

  //basically the reverse of add dream!

  //then we can call the updatedream method

  //we also need a delete dream method - where are we going to put that?



  ButtonList bl;

  @override
  Widget build(BuildContext context) {
    return DreamEntryForm("Edit Dream", _editingKey,_submit,
    control1, control2, control3); //bl.buttonsList);
  }
}
