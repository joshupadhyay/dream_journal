import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
      child: FlatButton.icon(
          onPressed: null,
          label: Text(""),
          icon: Icon(
            Icons.add_box,
            color: Colors.deepPurple,
            size: 200.0,
          )),
    ));
  }
}
