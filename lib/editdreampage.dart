import 'package:dreamjournal/models/dreamentrypage.dart';
import 'package:flutter/material.dart';


class EditDreamPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>_EditDreamPageState();
}

class _EditDreamPageState extends State<EditDreamPage>{

  final _editingKey = new GlobalKey<FormState>();

  bool _submit(GlobalKey<FormState> _formKey) {
    if (_formKey.currentState.validate()) {
      //checks if everything has been filled out properly
      _formKey.currentState.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return DreamEntryForm("Edit Dream", _editingKey,_submit);
  }
}
