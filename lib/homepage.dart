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
      backgroundColor: Image.asset('').color,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 10,
              right: 0,
              top: 200,
              child: newDreamEntryButton(context),
            ),

            Positioned(
                left: 120,
                top: 350,
                child: Text(
                  "new dream",
                  style: TextStyle(
                      fontFamily: "Permanent",
                      fontSize: 30.0,
                      color: Colors.white
                  ),
                )
            ),

          ],
        ),
      ),
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
    Icons.add_circle,
    color: Colors.pinkAccent,
    size: 250.0,),
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
    Icons.add_circle,
    color: Colors.pinkAccent,
    size: 250.0,),
      label: Text("")
  );
}


//Text("",
//textAlign: TextAlign.left,
//style: TextStyle(fontFamily: "Pacifico",
//fontSize: 20.0,
//fontWeight: FontWeight.bold)));