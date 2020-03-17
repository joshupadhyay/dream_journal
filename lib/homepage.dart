import 'package:flutter/material.dart';
import 'dreamentrypage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[//add something here, I assume
            newDreamEntryButton(context)],
        )
    );
  }
}


Widget newDreamEntryButton(BuildContext context){
  return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text("Add new dream"),
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new DreamEntryPage()),
          );
        },
      )
  );
}