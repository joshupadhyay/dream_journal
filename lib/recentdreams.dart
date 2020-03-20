
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/dreamentry.dart';


class RecentDreams extends StatefulWidget {
  @override
  _RecentDreamsState createState() => _RecentDreamsState();
}




class _RecentDreamsState extends State<RecentDreams> {

  List <DreamEntry> dreamentries = [
    DreamEntry(true, dreamTitle: 'Singing Kareoke',
        dreamPeople: 'Josh, Federico, IU'),
    DreamEntry(true, dreamTitle: 'Missed Flight and Granola',
        dreamPeople: 'Josh, Liam, Shafim'),
    DreamEntry(true, dreamTitle: 'Getting Stuck in the Basement, Parasite House ',
        dreamPeople: "Josh, Josh's Family, Izzy"),

  ];

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: dreamentries.length,
        itemBuilder: (context, i) => Container(
              width: 390,
              height: 70,
              child: Card(
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)
                  ),

                  child: FlatButton(
                    onPressed: (){
                      /*here's where we'd pass in the editdream page, with fields autopopulated*/
                    },
                      highlightColor: Colors.orange,
                      child: Column(
                        children: <Widget>[
                          Flexible(
                              child: Text(
                                  dreamentries[i].dreamTitle,
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.blue,
                                  ))),
                          Flexible(
                              child: SizedBox(height: 6))
                          ,
                          Flexible(
                              child: Text(
                                  dreamentries[i].dreamPeople,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.teal
                                  )
                              ))
                        ],
                      )))));
  }

}




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Recent Dreams'),
      ),
      body: Column(
        children: <Widget>[RecentDreams()],
      ),
    );
  }
