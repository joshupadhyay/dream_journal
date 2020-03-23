
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/dreamentry.dart';
import 'editdream.dart';


class RecentDreams extends StatefulWidget {
  @override
  _RecentDreamsState createState() => _RecentDreamsState();
}




class _RecentDreamsState extends State<RecentDreams> {
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


  List <DreamEntry> dreamentries = [
    DreamEntry(true, dreamTitle: 'Singing Kareoke',
    dreamPeople: 'Josh, Federico, IU'),
    DreamEntry(true, dreamTitle: 'Missed Flight and Granola',
        dreamPeople: 'Josh, Liam, Shafim'),
    DreamEntry(true, dreamTitle: 'Getting Stuck in the Basement, Parasite House ',
        dreamPeople: "Josh, Josh's Family, Izzy"),

  ];

  Widget dreamTemplate(dreamentry){
    return
      Center(
        child: Container(
      width: 390,
        height: 70,
        child: Card(
          margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2)
      ),

      child: FlatButton(
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => EditDreamPage()
              ));

        },
        child: Column(
          children: <Widget>[
            Flexible(
                child: Text(
                dreamentry.dreamTitle,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                ))),
            Flexible(
              child: SizedBox(height: 6))
            ,
            Flexible(
              child: Text(
                dreamentry.dreamPeople,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.teal
                )
            ))
          ],
        )))));
    }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Recent Dreams'),
      ),
      body: Column(
        children: dreamentries.map((dreamentry) => dreamTemplate(dreamentry)).toList()
        )
    );
  }
}