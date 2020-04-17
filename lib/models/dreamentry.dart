import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
//make an emotion class - icon, name of emotion
//dreamentry has a list of emotions, so you only have to add a new emotion once (to the list)
//emotionbuilder then just gets passed that list


class DreamEntry {
  String dreamTitle;
  String dreamPeople;
  String dreamLocation;
  int isHappy;
  ///add other emotions here


  DreamEntry({int isHappy, String dreamTitle, String dreamPeople, String dreamLocation}){
    this.dreamPeople = dreamPeople;
    this.dreamTitle = dreamTitle;
    this.dreamLocation = dreamLocation;
    this.isHappy = isHappy;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': null, //null so id will autoincrement, see database.dart file
      'dreamtitle': dreamTitle,
      'dreamlocation': dreamLocation,
      'dreampeople': dreamPeople,
      'ishappy': isHappy
      ///add other emotions here
      ///if you add emotions here, note you need to add them to multiple places in the database!
    };
  }

}


