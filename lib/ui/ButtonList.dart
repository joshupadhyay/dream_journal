import 'package:dreamjournal/models/dreamentryclass.dart';
import 'package:dreamjournal/ui/EmoteButton.dart';
import 'package:dreamjournal/ui/Emotion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Make this a stateful widget that renders each button.
// i.e. does what emotebuttonbuilder currently does

class ButtonList extends StatefulWidget{

  var emotionsList;
  var buttonsList;

  ButtonList(DreamEntryClass dreamEntry){
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
      new Emotion(name:"Sad", emoji:AssetImage("lib/assets/images/SadEmoji.png"), onColor: Colors.blueAccent),
      //scared
      new Emotion(name:"Scared", emoji:AssetImage("lib/assets/images/ScaredEmoji.png"), onColor: Colors.purpleAccent),

    ];

    buttonsList = <EmoteButton>[
      //angry
      new EmoteButton(id:1, emotion: emotionsList[0], on: intToBool(dreamEntry.isAngry)),
      //embarrassed
      new EmoteButton(id:2, emotion: emotionsList[1], on: intToBool(dreamEntry.isEmbarassed)),
      //confused
      new EmoteButton(id:3, emotion: emotionsList[2], on: intToBool(dreamEntry.isContemplative)),
      //excited
      new EmoteButton(id:4, emotion: emotionsList[3], on: intToBool(dreamEntry.isExcited)),
      //happy
      new EmoteButton(id:5, emotion: emotionsList[4], on: intToBool(dreamEntry.isHappy)),
      //relaxed
      new EmoteButton(id:6, emotion: emotionsList[5], on: intToBool(dreamEntry.isCool)),
      //sad
      new EmoteButton(id:7, emotion: emotionsList[6], on: intToBool(dreamEntry.isSad)),
      //scared
      new EmoteButton(id:8, emotion: emotionsList[7], on: intToBool(dreamEntry.isScared)),

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
      padding: const EdgeInsets.all(18.0),  // padding from edge of screen
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,  // how many across
        childAspectRatio: 1.0,  //increase to make squashed
        crossAxisSpacing: 18.0, // this num and num below should be the same for padding
        mainAxisSpacing: 18.0,
      ),
      itemCount: widget.buttonsList.length,
      itemBuilder: (context, i) => SizedBox(
          width: 100.0,
          height: 100.0,
          child:
          widget.buttonsList[i]
      ),
    );
  }

}