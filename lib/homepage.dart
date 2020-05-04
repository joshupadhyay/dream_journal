import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'adddreampage.dart';
import 'recentdreams.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/Aidan_Dream_BG_1.jpg",
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          fit: BoxFit.cover,

        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Stack(
              children: <Widget>[
                Positioned( // open book icon placement
                  left: 0,
                  right: 0,
                  top: MediaQuery
                      .of(context)
                      .size
                      .height * 0.05,
                  child: Icon(
                    FontAwesomeIcons.bookOpen,
                    color: Colors.black54,
                    size: MediaQuery
                        .of(context)
                        .size
                        .width * 0.2,
                  ),
                ),
                Positioned( // "D" placement
                  left: 0 - MediaQuery
                      .of(context)
                      .size
                      .width * 0.125,
                  right: 0,
                  top: MediaQuery
                      .of(context)
                      .size
                      .height * 0.07,
                  child: Text(
                    "D",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Pacifico",
                      fontSize: MediaQuery
                          .of(context)
                          .size
                          .width * 0.08,
                      color: Colors.white70,

                    ),
                  ),
                ),
                Positioned(  // "J" placement
                  left: 0 + MediaQuery
                      .of(context)
                      .size
                      .width * 0.125,
                  right: 0,
                  top: MediaQuery
                      .of(context)
                      .size
                      .height * 0.07,
                  child: Text(
                    "J",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Pacifico",
                      fontSize: MediaQuery
                          .of(context)
                          .size
                          .width * 0.08,
                      color: Colors.blueGrey[200],

                    ),
                  ),
                ),
                Positioned( // new dream entry placement
                  left: 20,
                  right: 10,
                  top: MediaQuery
                      .of(context)
                      .size
                      .height * 0.32, // double changes height, larger means lower
                  child: newDreamEntryButton(context),
                ),

                Positioned(       // new dream text
                    left: 140,
                    top: MediaQuery
                        .of(context)
                        .size
                        .height * 0.55,
                    child: Text(
                      "new dream",
                      style: TextStyle(
                          fontFamily: "Permanent",
                          fontSize: 25.0,
                          color: Colors.black87
                      ),
                    )
                ),
                Positioned( // position for recent dreams button
                  left: 300,
                  right: 0,
                  top: MediaQuery
                      .of(context)
                      .size
                      .height * 0.85,
                  child: newDreamViewerButton(context),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

//newDreamEntryButton(context),


Widget newDreamEntryButton(BuildContext context) {        // new dream button
  return FlatButton.icon(onPressed: () {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new AddDreamPage()),
    );
  }, icon: Icon(
    Icons.add_circle_outline,
    color: Colors.black87,
    size: MediaQuery
        .of(context)
        .size
        .width * 0.5,   //this double changes size of button
  ),
      label: Text("")
  );
}


Widget newDreamViewerButton(BuildContext context) {     // recent dream page button
  return FlatButton.icon(onPressed: () {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new RecentDreams()),
    );
  }, icon: Icon(
    FontAwesomeIcons.book,
    color: Colors.black87,
    size: MediaQuery
        .of(context)
        .size
        .width * 0.1,
  ),
      label: Text("")
  );
}


//Text("",
//textAlign: TextAlign.left,
//style: TextStyle(fontFamily: "Pacifico",
//fontSize: 20.0,
//fontWeight: FontWeight.bold)));