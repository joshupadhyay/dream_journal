
/*All the code for the emotion buttons. */
import 'package:dreamjournal/models/Emotion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dreamjournal/ui//ButtonList.dart';
import 'EmoteButton.dart';

class buttonEmotionBuilder extends StatefulWidget{
  ButtonList bl;  // used to access the ButtonList class, which has a field buttonsList which is the actual list
  buttonEmotionBuilder(this.bl);
  _ButtonEmotionState createState() => _ButtonEmotionState();
}

class _ButtonEmotionState extends State<buttonEmotionBuilder>{

  @override
  void initState() {
    super.initState();
    if (widget.bl == null) {
      widget.bl = new ButtonList();
    }//initializing ButtonList class
  }

  void switchState(EmoteButton b) {

    setState(() { // to recall build, so it rebuilds
      b.on = !b.on; // to switch on and off
      if (b.on) {
        b.displayColor = b.emotion.onColor; // bg is the actual displayed color, color1 and color2 are just the on/off colors respectively

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
      itemCount: widget.bl.getButtonList().length,
      itemBuilder: (context, i) => SizedBox(
        width: 100.0,
        height: 100.0,
        child: RaisedButton(
          padding: const EdgeInsets.all(18.0),
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0)),
          onPressed: widget.bl.buttonsList[i].enabled?()=>switchState(widget.bl.buttonsList[i]):null, // if the button is enabled, call switchState, else do null
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:widget.bl.buttonsList[i].emotion.emoji,
                  ),
              )
          ),
          color: widget.bl.buttonsList[i].displayColor,
          disabledColor: widget.bl.buttonsList[i].displayColor,
        ),
      ),
    );
  }
}
