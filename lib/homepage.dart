import 'package:flutter/material.dart';
import 'dreamentrypage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}




class _HomePageState extends State<HomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
          child:Column(

            children: <Widget>[
              Text(
                '$_counter',
                style: TextStyle(fontFamily: "Pacifico",
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold
                )),
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
