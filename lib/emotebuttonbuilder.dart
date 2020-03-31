
/*All the code for the emotion buttons. */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'EmoteButton.dart';

class buttonEmotionBuilder extends StatefulWidget{
  _ButtonEmotionState createState() => _ButtonEmotionState();
}

class _ButtonEmotionState extends State<buttonEmotionBuilder>{

  var buttonsList = <EmoteButton>[
    new EmoteButton(id:1, bg:Colors.blue, color1: Colors.blue, color2: Colors.deepOrange),  // just did a couple random colors for proof of concept
    new EmoteButton(id:2),
    new EmoteButton(id:3),
    new EmoteButton(id:4, bg:Colors.orange, color1:Colors.orange, color2:Colors.lightGreenAccent),
    new EmoteButton(id:5),
    new EmoteButton(id:6),
    new EmoteButton(id:7, bg:Colors.orange, color1:Colors.orange, color2:Colors.lightGreenAccent),
    new EmoteButton(id:8, bg:Colors.blue, color1: Colors.blue, color2: Colors.deepOrange),
    new EmoteButton(id:9),
    new EmoteButton(id:10),
    new EmoteButton(id:11, bg:Colors.blue, color1: Colors.blue, color2: Colors.deepOrange),
    new EmoteButton(id:12),
  ];

  @override
  void initState() {
    super.initState();
  }

  void switchState(EmoteButton b) {

    setState(() { // to recall build, so it rebuilds
      b.on = !b.on; // to switch on and off
      if (b.on) {
        b.bg = b.color2;  // bg is the actual displayed color, color1 and color2 are just the on/off colors respectively
      }
      else {
        b.bg = b.color1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(18.0),  // padding from edge of screen
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,  // how many across
        childAspectRatio: 1.0,  //increase to make squashed
        crossAxisSpacing: 18.0, // this num and num below should be the same for padding
        mainAxisSpacing: 18.0,
      ),
      itemCount: buttonsList.length,
      itemBuilder: (context, i) => SizedBox(
        width: 100.0,
        height: 100.0,
        child: RaisedButton(
          padding: const EdgeInsets.all(18.0),
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0)),
          onPressed: buttonsList[i].enabled?()=>switchState(buttonsList[i]):null, // if the button is enabled, call switchState, else do null
          child: Text(
              buttonsList[i].activeText,
              style: TextStyle(color: Colors.limeAccent,
                  fontSize: 40.0)),
          color: buttonsList[i].bg,
          disabledColor: buttonsList[i].bg,
        ),
      ),
    );
  }
}
