import 'package:flutter/material.dart';

class EmoteButton{
  final id;
  String activeText;
  Color bg; // when initialized, bg and color1 have to be the same
  Color color1;
  Color color2;
  bool enabled;
  bool on;
  AssetImage emoji;

  EmoteButton({this.id, this.emoji, this.activeText = "", this.bg = Colors.grey, this.color1 = Colors.grey, this.color2 = Colors.yellowAccent, this.enabled = true, this.on = false});
}
