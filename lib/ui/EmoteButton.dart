import 'package:dreamjournal/ui/Emotion.dart';
import 'package:flutter/material.dart';

//TODO: Make this a widget that renders itself
// I.e this should have a build method that does this:
// RaisedButton(
//           padding: const EdgeInsets.all(18.0),
//           shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0)),
//           onPressed: widget.bl.buttonsList[i].enabled?()=>switchState(widget.bl.buttonsList[i]):null, // if the button is enabled, call switchState, else do null
//           child: Container(
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image:widget.bl.buttonsList[i].emotion.emoji,
//                   ),
//               )
//           ),
//           color: widget.bl.buttonsList[i].displayColor,
//           disabledColor: widget.bl.buttonsList[i].displayColor,
//         ),

class EmoteButton extends StatefulWidget{
  final id;
  Emotion emotion;
  Color displayColor; // the displayed color
  bool enabled;
  bool on;

  EmoteButton({this.id, this.emotion, this.displayColor = Colors.grey, this.enabled = true, this.on = false});

  @override
  EmoteButtonState createState() => EmoteButtonState();

}

class EmoteButtonState extends State<EmoteButton>{

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: const EdgeInsets.all(18.0),
      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0)),
      onPressed: widget.enabled?()=>switchState():null, // if the button is enabled, call switchState, else do null
      child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: widget.emotion.emoji,
            ),
          )
      ),
      color: widget.displayColor,
      disabledColor: widget.displayColor,
    );
  }

  void switchState() {

    setState(() { // to recall build, so it rebuilds
      widget.on = !widget.on; // to switch on and off
      if (widget.on) {
        widget.displayColor = widget.emotion.onColor; // bg is the actual displayed color, color1 and color2 are just the on/off colors respectively

      }
      else {
        widget.displayColor = widget.emotion.offColor;
      }
    });
  }

}
