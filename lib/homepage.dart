import 'package:flutter/material.dart';
import 'adddreampage.dart';

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
          child:Column(
            children: <Widget>[
               newDreamEntryButton(context)
            ],


          )

    )
    );
  }
}

Widget newDreamEntryButton(BuildContext context){
  return FlatButton.icon(onPressed: () {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new DreamEntryPage()),
    );
  }, icon: Icon(
    Icons.add_circle,
    color: Colors.pinkAccent,
    size: 250.0,),
      label: Text("Add Dream",
          textAlign: TextAlign.left,
          style: TextStyle(fontFamily: "Pacifico",
              fontSize: 20.0,
              fontWeight: FontWeight.bold)));
}
