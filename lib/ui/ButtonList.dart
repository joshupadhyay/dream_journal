import 'package:DreamJournal/models/dreamentryclass.dart';
import 'package:DreamJournal/ui/EmoteButton.dart';
import 'package:DreamJournal/ui/Emotion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Makes a ButtonList widget that is a list of buttons made up of
/// EmoteButton widgets

class ButtonList extends StatefulWidget{

  var emotionsList;
  var buttonsList;
  int numAcross;
  bool isEnabled;
  var buttonPadding;
  var buttonSpacing;
  var buttonBuilderHeight;

  ButtonList(DreamEntryClass dreamEntry, {this.numAcross = 4, this.isEnabled = true,
  this.buttonPadding = const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 1.0),
  this.buttonSpacing = 18.0, this.buttonBuilderHeight = 100.0}){
    //optional arguments allow for buttonlist use in recentdreams/dreamentryform
    init(dreamEntry);
  }

  List<Emotion> getEmotionsList(){
    return emotionsList;
  }

  List<EmoteButton> getButtonList(){
    return buttonsList;
  }

  // has to be called to make sure the lists are filled
  void init(DreamEntryClass dreamEntry){
    emotionsList = <Emotion>[
      // angry
      new Emotion(name:"Angry", emoji:AssetImage("lib/assets/images/AngryEmoji.png"), onColor: Colors.deepOrange),
      //embarassed
      new Emotion(name:"Embarassed", emoji:AssetImage("lib/assets/images/AnxiousEmoji.png"), onColor: Colors.lightGreenAccent),
      //confused
      new Emotion(name:"Contemplative", emoji:AssetImage("lib/assets/images/ConfusedEmoji.png"), onColor: Colors.cyanAccent),
      //excited
      new Emotion(name:"Excited", emoji:AssetImage("lib/assets/images/ExcitedEmoji.png"), onColor: Colors.amber),
      //happy
      new Emotion(name:"Happy", emoji:AssetImage("lib/assets/images/HappyEmoji.png"), onColor: Colors.yellowAccent),
      //relaxed
      new Emotion(name:"Cool", emoji:AssetImage("lib/assets/images/RelaxedEmoji.png"), onColor: Colors.lightBlueAccent),
      //sad
      new Emotion(name:"Sad", emoji:AssetImage("lib/assets/images/SadEmoji.png"), onColor: Colors.blueAccent),
      //scared
      new Emotion(name:"Scared", emoji:AssetImage("lib/assets/images/ScaredEmoji.png"), onColor: Colors.green),

    ];

    buttonsList = <EmoteButton>[
      //angry
      new EmoteButton(id:1, emotion: emotionsList[0], on: intToBool(dreamEntry.isAngry), enabled: isEnabled),
      //embarrassed
      new EmoteButton(id:2, emotion: emotionsList[1], on: intToBool(dreamEntry.isEmbarassed), enabled: isEnabled),
      //confused
      new EmoteButton(id:3, emotion: emotionsList[2], on: intToBool(dreamEntry.isContemplative), enabled: isEnabled),
      //excited
      new EmoteButton(id:4, emotion: emotionsList[3], on: intToBool(dreamEntry.isExcited), enabled: isEnabled),
      //happy
      new EmoteButton(id:5, emotion: emotionsList[4], on: intToBool(dreamEntry.isHappy), enabled: isEnabled),
      //relaxed
      new EmoteButton(id:6, emotion: emotionsList[5], on: intToBool(dreamEntry.isCool), enabled: isEnabled),
      //sad
      new EmoteButton(id:7, emotion: emotionsList[6], on: intToBool(dreamEntry.isSad), enabled: isEnabled),
      //scared
      new EmoteButton(id:8, emotion: emotionsList[7], on: intToBool(dreamEntry.isScared), enabled: isEnabled),

    ];

  }

  @override
  ButtonListState createState() => ButtonListState();

}


bool intToBool(int a) => a == 1 ? true : false; //converts a bool to an int. 1 returns true, everything else returns false


class ButtonListState extends State<ButtonList>{
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: widget.buttonPadding,  // padding from edge of screen
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.numAcross,  // how many across
        childAspectRatio: 1.0,  //increase to make squashed
        crossAxisSpacing: widget.buttonSpacing, // this num and num below should be the same for padding
        mainAxisSpacing: widget.buttonSpacing,
      ),
      itemCount: widget.buttonsList.length,
      itemBuilder: (context, i) => SizedBox(
          width: 100.0,
          height: widget.buttonBuilderHeight,
          child:
          widget.buttonsList[i]
      ),
      physics: NeverScrollableScrollPhysics(),
    );
  }

}