import 'package:dreamjournal/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'models/dbmanager.dart';
import 'models/dreamentryclass.dart';
import 'editdreampage.dart';
import 'ui/ButtonList.dart';


/*
Page for showing saved / recent dream entries
 */

class RecentDreams extends StatefulWidget {
  @override
  _RecentDreamsState createState() => _RecentDreamsState();
}

class _RecentDreamsState extends State<RecentDreams> {
  DBManager dbmanager = DBManager();

  // List<DreamEntry> dreamentries;
  Future<List<DreamEntryClass>> data;

  @override
  void initState() {
    super.initState();
   data = dbmanager.dreamList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Recent Dreams') ,
          actions: <Widget>[
            homepage(context)] ) ,
        body: dreamCardsBuilder(context)
    );
}

  Widget dreamCardsBuilder(BuildContext context) {
    return  FutureBuilder<List<DreamEntryClass>>(
            future: data,
            builder: (_, dream_entry) {

              switch (dream_entry.connectionState) {
                case ConnectionState.none:
                  return Container();
                case ConnectionState.waiting:
                  return Container();
                case ConnectionState.active:
                case ConnectionState.done:
                  return ListView.builder(
                    itemCount: dream_entry.data.length,
                    itemBuilder: (context, index){

                      return Column(
                        children: dream_entry.data.map<Widget>((dreamentry) => dreamTemplate(dreamentry, context)).toList(),
                      );
                      
                    },
                  );
              }
            }
            
        );
  }


//code for the text above the dream entry cards
Widget _helptext() {
  return Container(
    child: Text("Tap on any of the entries to edit them!" ,
        textAlign: TextAlign.center ,
        style: TextStyle(
            fontWeight: FontWeight.bold ,
            fontSize: 15 ,
            color: Colors.greenAccent
        )) ,
  );
}



  ///if you want to adjust height and width of the cards, do so right here

Widget dreamTemplate(dreamentry , BuildContext context) {
  return
    Center(
        child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width * 0.9 ,
            height: MediaQuery
                .of(context)
                .size
                .height * 0.127 ,
            child: Row(
              children: <Widget>[
                Flexible(
                    child: newCards(dreamentry, context) ,
                    flex: 13
                ) ,
                Flexible(
                  child: newDeleteIcon(dreamentry, context) ,
                  flex: 1 ,
                )
              ] ,
            )
        )
    );
}


Widget newCards(dreamentry , BuildContext context) {

  var dateformat = new DateFormat('MMMMd'); //for nice date formatting

  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    child: Card(
      margin: EdgeInsets.fromLTRB(8,6,8,0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
      ) ,
      color: Colors.white70,
      child: FlatButton(
          onPressed: () {
            Navigator.push(context ,
                MaterialPageRoute(
                    builder: (context) =>
                        EditDreamPage(dreamEntry: dreamentry) //index add
                ));
          } ,

          child: Column(
              children: <Widget>[
                Flexible(
                    child: Text(
                        dreamentry.dreamTitle.toString() ,
                        style: TextStyle(
                          fontSize: 20 ,
                          color: Colors.blue ,
                        ))),

                Flexible(
                  child:  Text('${dateformat.format(dreamentry.date)}',
                        style: TextStyle(
                          fontSize: 14 ,
                          color: Colors.blue ,
                        )
                  )
                ),

                Flexible(
                    child: Text(
                        dreamentry.dreamPeople.toString(),
                        style: TextStyle(
                            fontSize: 12 ,
                            color: Colors.teal
                        )
                    )),

                Flexible(
                  child: ButtonList(dreamentry, numAcross: 8, isEnabled: false)
                )
              ]
          )

  )

  )
  );
}

Widget newDeleteIcon(DreamEntryClass dreamEntry , BuildContext context) {
  return IconButton(onPressed: () {
    dbmanager.deleteDream(dreamEntry.id);
    print(dreamEntry.id);

    Navigator.push(context ,
        MaterialPageRoute(
            builder: (context) => RecentDreams() //index add
        ));
  } ,
      icon: Icon(
        FontAwesomeIcons.trashAlt ,
        color: Colors.white54 ,
        size: MediaQuery
            .of(context)
            .size
            .width * 0.05)
  );
}

Widget homepage(BuildContext context) {
  return IconButton(onPressed: () {
    Navigator.push(
      context ,
      new MaterialPageRoute(builder: (context) => new HomePage()) ,
    );
  } , icon: Icon(
    FontAwesomeIcons.home ,
    color: Colors.white54 ,
    size: MediaQuery
        .of(context)
        .size
        .width * 0.05)
  );
}
}