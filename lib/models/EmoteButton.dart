import 'package:dreamjournal/models/Emotion.dart';
import 'package:flutter/material.dart';

class EmoteButton{
  final id;
  Emotion emotion;
  Color displayColor; // the displayed color
  bool enabled;
  bool on;

  EmoteButton({this.id, this.emotion, this.displayColor = Colors.grey, this.enabled = true, this.on = false});
}
