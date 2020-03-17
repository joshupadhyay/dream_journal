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
          children: <Widget>[Container(
            child: headingText(),
          ),
            newDreamEntryButton(context)],
        )
    );
  }
}

Widget headingText() { //just separated this widget
  return Text('Dream Journal App',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic, //just some placeholder stuff
      ));
}

Widget newDreamEntryButton(BuildContext context){
  return Container(
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