import 'package:flutter/material.dart';
import 'homepage.dart';
import 'models/dreamentry.dart';

class DreamEntryPage extends StatefulWidget{
  @override
  _DreamEntryPageState createState() => _DreamEntryPageState();

}

class _DreamEntryPageState extends State<DreamEntryPage>{
  final _dreamentry = DreamEntry();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("New Dream Entry")),
      body: Container(
        padding:
          const EdgeInsets.symmetric(vertical: 40),
        child: Builder(
          builder: (context) => Form(//contains all logical stuff
            key: _formKey, //will be using formkey to get access to form data
            child: Column(//container for all our form fields
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(),
                TextFormField(),
                TextFormField(),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                  child: Text('test text'),
                ),
              ],

            )
          )
        )
      ),
    );
  }



}