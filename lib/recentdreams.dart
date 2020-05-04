import 'package:dreamjournal/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'adddreampage.dart';
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
    return Stack(
      children: <Widget>[
    Image.asset(
    "assets/images/Aidan_BG_Muted.jpg",
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    ),
    Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Recent Dreams'),
            automaticallyImplyLeading: false,
          actions: <Widget>[
            homepage(context), adddreampage(context)] ) ,
        body: dreamListBuilder(context)
    )
    ],
    );
}

///grabs the data from the SQL database and builds it into dreamcard, dreamcardlayout

  Widget dreamListBuilder(BuildContext context) {
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
                      DreamEntryClass dreamentry = dream_entry.data[index];
                      return dreamCardLayout(dreamentry, context);
                    },
                  );
              }
            }
        );
  }


///controls the layout, width and spacing of the dreamcards

Widget dreamCardLayout(dreamentry , BuildContext context) {
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
                .height * 0.17 ,
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              children: <Widget>[
                Flexible(
                    child: dreamCard(dreamentry, context) ,
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


///Builds each dream entry card to be displayed

Widget dreamCard(dreamentry , BuildContext context) {

  var dateformat = new DateFormat('MMMMd'); //for nice date formatting

  return Container(
    child: Card(
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
                          fontSize: MediaQuery.of(context).size.width*0.075 ,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold
                        ))),

                Flexible(
                  child:  Text('${dateformat.format(dreamentry.date)}',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width*0.035 ,
                          color: Colors.black,
                        )
                  )
                ),

                Flexible(
                  child: ButtonList(dreamentry, numAcross: 8,
                      isEnabled: false,

                  //TODO: make the edgeinsets relative, using mediaquery calls
                  buttonPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    buttonBuilderHeight: 80.0,
                  ),

                )
              ]
          )

  )

  )
  );
}


///delete icon for each dreamcard

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

  ///homepagebutton / adddreampage buttons in appbar

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
  Widget adddreampage(BuildContext context) {
    return IconButton(onPressed: () {
      Navigator.push(
        context ,
        new MaterialPageRoute(builder: (context) => new AddDreamPage()) ,
      );
    } , icon: Icon(
        FontAwesomeIcons.plusCircle ,
        color: Colors.white54 ,
        size: MediaQuery
            .of(context)
            .size
            .width * 0.05)
    );
}
}