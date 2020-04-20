
/*All the code for the emotion buttons. */
import 'package:dreamjournal/models/Emotion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ButtonList.dart';
import 'EmoteButton.dart';

class buttonEmotionBuilder extends StatefulWidget{
  _ButtonEmotionState createState() => _ButtonEmotionState();
}

class _ButtonEmotionState extends State<buttonEmotionBuilder>{


  ButtonList bl;

  @override
  void initState() {
    super.initState();
    bl = new ButtonList();
    bl.init();
  }

  void switchState(EmoteButton b) {

    setState(() { // to recall build, so it rebuilds
      b.on = !b.on; // to switch on and off
      if (b.on) {
        b.displayColor = b.emotion.onColor; // bg is the actual displayed color, color1 and color2 are just the on/off colors respectively

        //TODO: how can we use switchState() from here to change boolean values in DreamEntry class?
      }
      else {
        b.displayColor = b.emotion.offColor;
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
      itemCount: bl.getButtonList().length,
      itemBuilder: (context, i) => SizedBox(
        width: 100.0,
        height: 100.0,
        child: RaisedButton(
          padding: const EdgeInsets.all(18.0),
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0)),
          onPressed: bl.buttonsList[i].enabled?()=>switchState(bl.buttonsList[i]):null, // if the button is enabled, call switchState, else do null
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:bl.buttonsList[i].emotion.emoji,
                  ),
              )
          ),
          color: bl.buttonsList[i].displayColor,
          disabledColor: bl.buttonsList[i].displayColor,
        ),
      ),
    );
  }
}
