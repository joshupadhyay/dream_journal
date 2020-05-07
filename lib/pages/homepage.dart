import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'adddreampage.dart';
import 'dreamlogpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

///Assembles the home page of our app

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/Aidan_Dream_BG_1.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment(0, -0.8),
                  child: Image.asset(
                    "assets/images/Quill_Colored.png",
                    height: MediaQuery.of(context).size.width * 0.25,
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                ),
                Positioned(
                  left: 20,
                  right: 10,
                  top: MediaQuery.of(context).size.height * 0.32,
                  // new dream entry placement// double changes height, larger means lower
                  child: dreamEntryButton(context),
                ),
                Align(
                    alignment: Alignment(0.0, 0.3),
                    child: Text(
                      "new dream",
                      style: TextStyle(
                          fontFamily: "Permanent",
                          fontSize: 25.0,
                          color: Colors.black87),
                    )),
                Positioned(
                    right: MediaQuery.of(context).size.width * 0.05,
                    top: MediaQuery.of(context).size.height * 0.75,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: recentDreamsViewerButton(context),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            "Dream Log",
                            style: TextStyle(
                                fontFamily: "Permanent",
                                fontSize: 14.0,
                                color: Colors.black87),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }
}

///newDreamEntryButton for going to new dream entry page

Widget dreamEntryButton(BuildContext context) {
  // new dream button
  return IconButton(
    iconSize: MediaQuery.of(context).size.width * 0.5,
    icon: Icon(
      Icons.add_circle_outline,
      color: Colors.black87,
      size: MediaQuery.of(context).size.width *
          0.5, //this double changes size of button
    ),
    onPressed: () {
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => new AddDreamPage()),
      );
    },
  );
}

///recentDreamsButton for going to recent dreams page

Widget recentDreamsViewerButton(BuildContext context) {
  // recent dream page button
  return IconButton(
    iconSize: MediaQuery.of(context).size.width * 0.15,
    onPressed: () {
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => new DreamLog()),
      );
    },
    icon: Icon(
      FontAwesomeIcons.book,
      color: Colors.black87,
      size: MediaQuery.of(context).size.width * 0.15,
    ),
  );
}
