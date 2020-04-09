import 'package:dreamjournal/models/dreamentrypage.dart';
import 'package:flutter/material.dart';
import 'models/dreamentry.dart';


class EditDreamPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>_EditDreamPageState();
}

class _EditDreamPageState extends State<EditDreamPage>{

  final _editingKey = new GlobalKey<FormState>();

  final control1 = TextEditingController();
  final control2 = TextEditingController();
  final control3 = TextEditingController();


  bool _submit(GlobalKey<FormState> _formKey) {
    if (_formKey.currentState.validate()) {
      //checks if everything has been filled out properly
      _formKey.currentState.save();

      return true;
    }
    return false;
  }

  //instantiate DreamEntryForm as edit dream page

  @override
  Widget build(BuildContext context) {
    return DreamEntryForm("Edit Dream", _editingKey,_submit,
    control1, control2, control3);
  }
}
