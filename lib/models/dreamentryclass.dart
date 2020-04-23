import 'package:dreamjournal/models/Emotion.dart';

import 'ButtonList.dart';
//make an emotion class - icon, name of emotion
//dreamentry has a list of emotions, so you only have to add a new emotion once (to the list)
//emotionbuilder then just gets passed that list


class DreamEntryClass {
  int id;
  String dreamTitle;
  String dreamPeople;
  String dreamLocation;
  int isAngry;
  int isEmbarassed;
  int isHappy;
  int isContemplative;
  int isSad;
  int isExcited;
  int isCool;
  int isScared;




  DreamEntryClass({int isHappy, String dreamTitle, String dreamPeople, String dreamLocation, int id}){
    this.dreamPeople = dreamPeople;
    this.dreamTitle = dreamTitle;
    this.dreamLocation = dreamLocation;
    this.isHappy = isHappy;
    this.id = id;
  }

  //TODO: once new emotions are added to DreamEntryClass constructor, see TODO in dreamList() in dbmanager.dart

  Map<String, dynamic> toMap() {
    return {
      'id': id, //null so id will autoincrement, see database.dart file
      'dreamtitle': dreamTitle,
      'dreamlocation': dreamLocation,
      'dreampeople': dreamPeople,
      'ishappy': isHappy
      ///add other emotions here

    };
  }


}


