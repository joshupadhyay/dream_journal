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

  ButtonList bl = new ButtonList();

  int isAngry;
  int isEmbarassed;
  int isContemplative;
  int isExcited;
  int isHappy;
  int isCool;
  int isSad;
  int isScared;


  DreamEntryClass({String dreamTitle, String dreamPeople, String dreamLocation, ButtonList bl, int isAngry, int isEmbarassed,
  int isContemplative, int isExcited, int isHappy, int isCool, int isSad, int isScared, int id}){
    this.dreamPeople = dreamPeople;
    this.dreamTitle = dreamTitle;
    this.dreamLocation = dreamLocation;
    this.bl = bl;
    this.isAngry = booltoint(bl.buttonsList[0].on);
    this.isEmbarassed = booltoint(bl.buttonsList[1].on);
    this.isContemplative = booltoint(bl.buttonsList[2].on);
    this.isExcited = booltoint(bl.buttonsList[3].on);
    this.isHappy = booltoint(bl.buttonsList[4].on);
    this.isCool = booltoint(bl.buttonsList[5].on);
    this.isSad = booltoint(bl.buttonsList[6].on);
    this.isScared = booltoint(bl.buttonsList[7].on);
    this.id = id;
  }

  //TODO: once new emotions are added to DreamEntryClass constructor, see TODO in dreamList() in dbmanager.dart

  Map<String, dynamic> toMap() {
    return {
      'id': id, //null so id will autoincrement, see database.dart file
      'dreamtitle': dreamTitle,
      'dreamlocation': dreamLocation,
      'dreampeople': dreamPeople,
      'isAngry': isAngry,
      'isEmbarassed': isEmbarassed,
      'isContemplative': isContemplative,
      'isExcited': isExcited,
      'isHappy': isHappy,
      'isCool': isCool,
      'isSad': isSad,
      'isScared': isScared
      ///add other emotions here

    };
  }
  int booltoint(bool_result) {
    if (bool_result == true){
      return 1;
    } else{
      return 0;
    }
  }

}


