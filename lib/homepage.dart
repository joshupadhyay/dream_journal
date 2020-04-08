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
          "assets/images/dreams.jpg",
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
                Positioned(
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
                Positioned(
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
                Positioned(
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
                Positioned(
                  left: 20,
                  right: 10,
                  top: MediaQuery
                      .of(context)
                      .size
                      .height * 0.35,
                  child: newDreamEntryButton(context),
                ),

                Positioned(
                    left: 140,
                    top: MediaQuery
                        .of(context)
                        .size
                        .height * 0.6,
                    child: Text(
                      "new dream",
                      style: TextStyle(
                          fontFamily: "Permanent",
                          fontSize: 25.0,
                          color: Colors.black87
                      ),
                    )
                ),
                Positioned(
                  left: 300,
                  right: 0,
                  top: MediaQuery
                      .of(context)
                      .size
                      .height * 0.85,
                  child: newDreamViewerButton(context),
                ),
                Positioned(
                  left: -300,
                  right: 0,
                  top: MediaQuery
                      .of(context)
                      .size
                      .height * 0.85,
                  child: newDreamAnalysisTab(context),
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


Widget newDreamEntryButton(BuildContext context) {
  return FlatButton.icon(onPressed: () {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new DreamEntryPage()),
    );
  }, icon: Icon(
    FontAwesomeIcons.plus,
    color: Colors.black87,
    size: MediaQuery
        .of(context)
        .size
        .width * 0.40,

  ),
      label: Text("")
  );
}


Widget newDreamViewerButton(BuildContext context) {
  return FlatButton.icon(onPressed: () {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new RecentDreams()),
    );
  }, icon: Icon(
    FontAwesomeIcons.book,
    color: Colors.white70,
    size: MediaQuery
        .of(context)
        .size
        .width * 0.1,
  ),
      label: Text("")
  );
}


Widget newDreamAnalysisTab(BuildContext context) {
  return FlatButton.icon(onPressed: () {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new RecentDreams()),
    );
  }, icon: Icon(
    FontAwesomeIcons.chartLine,
    color: Colors.white54,
    size: MediaQuery
        .of(context)
        .size
        .width * 0.1,),
      label: Text("")
  );
}




//Text("",
//textAlign: TextAlign.left,
//style: TextStyle(fontFamily: "Pacifico",
//fontSize: 20.0,
//fontWeight: FontWeight.bold)));