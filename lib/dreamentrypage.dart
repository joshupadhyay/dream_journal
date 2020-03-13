import 'package:dreamjournal/EmoteButton.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'models/dreamentry.dart';

class DreamEntryPage extends StatefulWidget{
  @override
  _DreamEntryPageState createState() => _DreamEntryPageState();

}

class _DreamEntryPageState extends State<DreamEntryPage>{
  final _dreamentry = DreamEntry();

  final _formKey = GlobalKey<FormState>();

  List<EmoteButton> buttons;

  @override
  void initState() {
    super.initState();
    buttons = doInit();
  }

  List<EmoteButton> doInit() {
    var buttonsList = <EmoteButton>[
      new EmoteButton(id:1, bg:Colors.blue, color1: Colors.blue, color2: Colors.deepOrange),  // just did a couple random colors for proof of concept
      new EmoteButton(id:2),
      new EmoteButton(id:3),
      new EmoteButton(id:4, bg:Colors.orange, color1:Colors.orange, color2:Colors.lightGreenAccent),
      new EmoteButton(id:5),
      new EmoteButton(id:6),
      new EmoteButton(id:7, bg:Colors.orange, color1:Colors.orange, color2:Colors.lightGreenAccent),
      new EmoteButton(id:8, bg:Colors.blue, color1: Colors.blue, color2: Colors.deepOrange),
      new EmoteButton(id:9),
      new EmoteButton(id:10),
      new EmoteButton(id:11, bg:Colors.blue, color1: Colors.blue, color2: Colors.deepOrange),
      new EmoteButton(id:12),
    ];
    return buttonsList;
  }

  void switchState(EmoteButton b) {
    setState(() { // to recall build, so it rebuilds
      b.on = !b.on; // to switch on and off
      if (b.on) {
        b.bg = b.color2;  // bg is the actual displayed color, color1 and color2 are just the on/off colors respectively
      }
      else {
        b.bg = b.color1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("New Dream Entry")),
      body: Container(
        padding:
          const EdgeInsets.symmetric(vertical: 40),
        child: Builder(
          builder: (context) => Form(//contains all logical stuff
            key: _formKey, //will be using formkey to get access to form data
            child: Column(//container for all our form fields
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(),
                TextFormField(),
                TextFormField(),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                  child: Text('test text'),
                ),
                //https://youtu.be/54L3DOm6MTo?t=697

                // BEGIN EMOTE BUTTON LAYOUT
//                GridView.builder(           // OK GUYS, I commented this out because it uses a different kind of builder, but it would actually be really convenient to have multiple types, so either we can implement that (link: https://flutterawesome.com/a-flutter-customer-listview-that-displays-multiple-widget-types/) Or we can find a different solution
//                  padding: const EdgeInsets.all(18.0),  // padding from edge of screen
//                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                    crossAxisCount: 3,  // how many across
//                    childAspectRatio: 1.0,  //increase to make squashed
//                    crossAxisSpacing: 18.0, // this num and num below should be the same for padding
//                    mainAxisSpacing: 18.0,
//                  ),
//                  itemCount: buttons.length,
//                  itemBuilder: (context, i) => SizedBox(
//                    width: 100.0,
//                    height: 100.0,
//                    child: RaisedButton(
//                      padding: const EdgeInsets.all(18.0),
//                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
//                      onPressed: buttons[i].enabled?()=>switchState(buttons[i]):null, // if the button is enabled, call switchState, else do null
//                      child: Text(
//                          buttons[i].activeText,
//                          style: TextStyle(color: Colors.limeAccent,
//                              fontSize: 40.0)),
//                      color: buttons[i].bg,
//                      disabledColor: buttons[i].bg,
//                    ),
//                  ),
//                ),
                // END EMOTE BUTTON LAYOUT


              ],

            ),
          ),
        ),
      ),
    );
  }



}