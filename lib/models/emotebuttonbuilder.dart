
/*All the code for the emotion buttons. */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'EmoteButton.dart';

class buttonEmotionBuilder extends StatefulWidget{
  _ButtonEmotionState createState() => _ButtonEmotionState();
}

class _ButtonEmotionState extends State<buttonEmotionBuilder>{

  var buttonsList = <EmoteButton>[
    new EmoteButton(id:1, emoji:AssetImage("lib/assets/images/AngryEmoji.png"), color2: Colors.deepOrange),  // just did a couple random colors for proof of concept
  new EmoteButton(id:2, emoji:AssetImage("lib/assets/images/AnxiousEmoji.png"), color2: Colors.lightGreen),
  new EmoteButton(id:3, emoji:AssetImage("lib/assets/images/ConfusedEmoji.png"), color2: Colors.cyanAccent),
  new EmoteButton(id:4, emoji:AssetImage("lib/assets/images/ExcitedEmoji.png"), color2: Colors.amber),
  new EmoteButton(id:5, emoji:AssetImage("lib/assets/images/HappyEmoji.png"), color2: Colors.yellowAccent),
  new EmoteButton(id:6, emoji:AssetImage("lib/assets/images/RelaxedEmoji.png"), color2: Colors.lightBlueAccent),
  new EmoteButton(id:7, emoji:AssetImage("lib/assets/images/SadEmoji.png"), color2:Colors.blueAccent),
  new EmoteButton(id:8, emoji:AssetImage("lib/assets/images/ScaredEmoji.png"), color2: Colors.purpleAccent),
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
        crossAxisCount: 4,  // how many across
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
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:buttonsList[i].emoji,
                  ),
              )
          ),
          color: buttonsList[i].bg,
          disabledColor: buttonsList[i].bg,
        ),
      ),
    );
  }
}
