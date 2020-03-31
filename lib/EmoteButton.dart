import 'package:flutter/material.dart';

class EmoteButton{
  final id;
  String activeText;
  Color bg; // when initialized, bg and color1 have to be the same
  Color color1;
  Color color2;
  bool enabled;
  bool on;

  EmoteButton({this.id, this.activeText = "", this.bg = Colors.purple, this.color1 = Colors.purple, this.color2 = Colors.greenAccent, this.enabled = true, this.on = false});
}
