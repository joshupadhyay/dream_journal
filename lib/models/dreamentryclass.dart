import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
//make an emotion class - icon, name of emotion
//dreamentry has a list of emotions, so you only have to add a new emotion once (to the list)
//emotionbuilder then just gets passed that list


class DreamEntryClass {
  int id;
  String dreamTitle;
  String dreamPeople;
  String dreamLocation;
  int isHappy;
  ///add other emotions here


  DreamEntryClass({int isHappy, String dreamTitle, String dreamPeople, String dreamLocation, int id}){
    this.dreamPeople = dreamPeople;
    this.dreamTitle = dreamTitle;
    this.dreamLocation = dreamLocation;
    this.isHappy = isHappy;
    this.id = id;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id, //null so id will autoincrement, see database.dart file
      'dreamtitle': dreamTitle,
      'dreamlocation': dreamLocation,
      'dreampeople': dreamPeople,
      'ishappy': isHappy
      ///add other emotions here
      ///if you add emotions here, note you need to add them to multiple places in the database!
    };
  }


}


