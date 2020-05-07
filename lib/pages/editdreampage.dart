import 'package:DreamJournal/models/dreamentryform.dart';
import 'package:flutter/material.dart';
import '../models/dreamentryclass.dart';
import '../models/dbmanager.dart';

/// page for editing a dream entry, inherits from DreamEntryForm in models

class EditDreamPage extends StatefulWidget {
  DreamEntryClass dreamEntry;

  EditDreamPage({this.dreamEntry}) : super();

  @override
  State<StatefulWidget> createState() => _EditDreamPageState();
}

class _EditDreamPageState extends State<EditDreamPage> {

  //built using dreamentry form
  @override
  Widget build(BuildContext context) {
    return DreamEntryForm(
        "Edit Dream", _editingKey, _submit, widget.dreamEntry);
  }

  DBManager dbmanager = DBManager();
  List<DreamEntryClass> dreamentries;
  Future data;

  @override
  void initState() {
    super.initState();
    data = dbmanager.dreamList();
  }

  final _editingKey = new GlobalKey<FormState>();

  bool _submit(GlobalKey<FormState> _formKey) {
    if (_formKey.currentState.validate()) {
      //checks if everything has been filled out properly, then only updates database

      dbmanager.updateDream(widget.dreamEntry);

      return true;
    }
    return false;
  }
}
