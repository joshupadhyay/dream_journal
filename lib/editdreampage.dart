import 'package:dreamjournal/models/dreamentryform.dart';
import 'package:flutter/material.dart';
import 'models/ButtonList.dart';
import 'models/dreamentryclass.dart';
import 'models/dbmanager.dart';


class EditDreamPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>_EditDreamPageState();

  final DreamEntryClass dreamentry;

  EditDreamPage({this.dreamentry}): super();

}

class _EditDreamPageState extends State<EditDreamPage>{

  DBManager dbmanager = DBManager();
  List<DreamEntryClass> dreamentries;

  // List<DreamEntry> dreamentries;
  Future data;

  @override
  void initState() {
    super.initState();
    data = showdreams();
  }

  Future <void> showdreams() async {
    dbmanager = this.dbmanager;
    List<DreamEntryClass> dreamlisted = await dbmanager.dreamList();
    dreamentries=dreamlisted;
  }


  final _editingKey = new GlobalKey<FormState>();


  bool _submit(GlobalKey<FormState> _formKey) {

    if (_formKey.currentState.validate()) {
      //checks if everything has been filled out properly

      dbmanager.updateDream(widget.dreamentry);

      return true;
    }
    return false;
  }

  ButtonList bl;

  @override
  Widget build(BuildContext context) {
    return DreamEntryForm("Edit Dream", _editingKey,_submit,
        // TextEditingController(text: widget.dreamentry.dreamTitle), //control 1
        // TextEditingController(text: widget.dreamentry.dreamLocation), //control 2
        // TextEditingController(text: widget.dreamentry.dreamPeople), //control 3
        widget.dreamentry); //bl.buttonsList);
  }

  //get rid of controls, just pass in dreamentry
}
