import 'package:flutter/material.dart';

class Emotion{
  String name;
  AssetImage emoji;
  Color onColor;
  Color offColor;

  Emotion({this.name, this.emoji, this.onColor, this.offColor = Colors.grey});
}