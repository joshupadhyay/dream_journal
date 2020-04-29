import 'package:dreamjournal/models/Emotion.dart';
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

class EmoteButton{
  final id;
  Emotion emotion;
  Color displayColor; // the displayed color
  bool enabled;
  bool on;

  EmoteButton({this.id, this.emotion, this.displayColor = Colors.grey, this.enabled = true, this.on = false});
}
