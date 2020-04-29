import 'package:dreamjournal/models/EmoteButton.dart';
import 'package:dreamjournal/models/Emotion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Make this a statefull widget that renders each button.
// i.e. does what emotebuttonbuilder currently does

class ButtonList extends StatefulWidget{{

  var emotionsList;
  var buttonsList;

  ButtonList({this.emotionsList, this.buttonsList}){
    init();
  }

  List<Emotion> getEmotionsList(){
    return emotionsList;
  }

  List<EmoteButton> getButtonList(){
    return buttonsList;
  }

  // has to be called to make sure the lists are filled
  void init(){
    emotionsList = <Emotion>[
      // angry
      new Emotion(name:"Angry", emoji:AssetImage("lib/assets/images/AngryEmoji.png"), onColor: Colors.deepOrange),
      //embarassed
      new Emotion(name:"Embarassed", emoji:AssetImage("lib/assets/images/AnxiousEmoji.png"), onColor: Colors.lightGreen),
      //confused
      new Emotion(name:"Contemplative", emoji:AssetImage("lib/assets/images/ConfusedEmoji.png"), onColor: Colors.cyanAccent),
      //excited
      new Emotion(name:"Excited", emoji:AssetImage("lib/assets/images/ExcitedEmoji.png"), onColor: Colors.amber),
      //happy
      new Emotion(name:"Happy", emoji:AssetImage("lib/assets/images/HappyEmoji.png"), onColor: Colors.yellowAccent),
      //relaxed
      new Emotion(name:"Cool", emoji:AssetImage("lib/assets/images/RelaxedEmoji.png"), onColor: Colors.lightBlueAccent),
      //sad
      new Emotion(name:"Sad", emoji:AssetImage("lib/assets/images/SadEmoji.png"), onColor:Colors.blueAccent),
      //scared
      new Emotion(name:"Scared", emoji:AssetImage("lib/assets/images/ScaredEmoji.png"), onColor: Colors.purpleAccent),

    ];

    buttonsList = <EmoteButton>[
      //angry
      new EmoteButton(id:1, emotion: emotionsList[0]),
      //embarrassed
      new EmoteButton(id:2, emotion: emotionsList[1]),
      //confused
      new EmoteButton(id:3, emotion: emotionsList[2]),
      //excited
      new EmoteButton(id:4, emotion: emotionsList[3]),
      //happy
      new EmoteButton(id:5, emotion: emotionsList[4]),
      //relaxed
      new EmoteButton(id:6, emotion: emotionsList[5]),
      //sad
      new EmoteButton(id:7, emotion: emotionsList[6]),
      //scared
      new EmoteButton(id:8, emotion: emotionsList[7]),

    ];

  }

}