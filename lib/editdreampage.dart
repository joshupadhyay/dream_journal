import 'package:dreamjournal/models/dreamentryform.dart';
import 'package:flutter/material.dart';
import 'package:dreamjournal/ui/ButtonList.dart';
import 'models/dreamentryclass.dart';
import 'models/dbmanager.dart';


class EditDreamPage extends StatefulWidget {

  DreamEntryClass dreamentry;
  ButtonList bl;

  EditDreamPage({this.dreamentry}): super();

  @override
  State<StatefulWidget> createState() =>_EditDreamPageState();

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
    widget.bl = new ButtonList(dreamEntry: widget.dreamentry);
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

  @override
  Widget build(BuildContext context) {
    return DreamEntryForm("Edit Dream", _editingKey,_submit, widget.dreamentry, widget.bl);
  }

}
