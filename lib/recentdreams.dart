
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/dreamentry.dart';
import 'editdreampage.dart';

/*
Page for showing saved / recent dream entries
 */

class RecentDreams extends StatefulWidget {
  @override
  _RecentDreamsState createState() => _RecentDreamsState();
}

class _RecentDreamsState extends State<RecentDreams> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Recent Dreams'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            _helptext(),
            Column(
              children: dreamentries.map((dreamentry) => dreamTemplate(dreamentry)).toList()
          )],
        )
    );
  }

  //code for the text above the dream entry cards
  Widget _helptext(){
    return Container(
      child: Text("Tap on any of the entries to edit them!",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.greenAccent
          )),
    );
  }

  //Currently just a list of dream summaries, based on dreamentry class
  List <DreamEntry> dreamentries = [
    DreamEntry(true, dreamTitle: 'Singing Kareoke',
    dreamPeople: 'Josh, Federico, IU'),
    DreamEntry(true, dreamTitle: 'Missed Flight and Granola',
        dreamPeople: 'Josh, Liam, Shafim'),
    DreamEntry(true, dreamTitle: 'Getting Stuck in the Basement, Parasite House ',
        dreamPeople: "Josh, Josh's Family, Izzy"),
  ];

  //card template for displaying entries

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
}