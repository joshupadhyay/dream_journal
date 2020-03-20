import 'package:dreamjournal/EmoteButton.dart';
import 'package:dreamjournal/recentdreams.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/dreamentry.dart';
import 'package:intl/intl.dart';

final _formKey = GlobalKey<FormState>(); //_formkey, will come in handy later for saving

//TODO: probably nest this function somewhere, looks weird just sitting out here
bool _submit() {

  if (_formKey.currentState.validate()){
    //checks if everything has been filled out properly
    _formKey.currentState.save();
    return true;
  }
  return false;
}

class DreamEntryPage extends StatefulWidget{
  @override
  _DreamEntryPageState createState() => _DreamEntryPageState();

}

class _DreamEntryPageState extends State<DreamEntryPage>{
  //final _dreamentry = DreamEntry(); //for when we start saving responses to the forms, etc

  var dateformat = new DateFormat('MMMMd'); //for nice date formatting
  DateTime _datetime = DateTime.now(); //to display today's date by default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Dream Entry"), centerTitle: true,),
      body: Column(
      children: <Widget>[OutlineButton(
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      child: Text('Date: ${dateformat.format(_datetime)}', //formatting today's date to show in button
        style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: Colors.teal)),
          onPressed: (){
          showDatePicker(context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2020),
              lastDate: DateTime(2025)).then((date){
                setState(() {
                  _datetime = date;
                });
              });
        }),
          /*Date Button widget ends right here*/

          textFieldsBuilder(context),

        new Flexible(
    child: buttonEmotionBuilder(),flex: 5,),
    new Flexible(
    child:RaisedButton(

    onPressed: (){
      if(_submit() == true){
        return Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new RecentDreams()));
        //if all OK submitting, open recent dreams page (successful submit only, validator will catch errors otherwise)
      }
      return null;
    },
        child: Text('submit')),flex: 1),
        ])
        //the other widgets!
          //TODO add borders, make the scrolling look nicer
      );

  }
}

/*Handles all the text fields, the question appearances, */

Widget textFieldsBuilder (BuildContext context) {
  final headingcolor = Colors.lightBlue; //used in TextStyle() and InputDecoration() to set question colors

  final _control1 = TextEditingController();
  final _control2 = TextEditingController();
  final _control3 = TextEditingController();


  //TODO: how to change inputted text style without messing up header text - maybe in input decoration param?

//https://youtu.be/54L3DOm6MTo?t=697 form building video that might come in handy for adding functionality, etc

  /*determines what headers, hints look like for textfield entry*/

  InputDecoration baselineInputDecorator(headertitle, hinttext, controllernum){

    return new InputDecoration(
      labelText: headertitle,
      labelStyle: TextStyle(color: headingcolor, fontWeight: FontWeight.bold,
      fontSize: 16),
      hintText: hinttext,
      hintStyle: TextStyle(fontStyle: FontStyle.italic),
      suffixIcon: IconButton(
        onPressed: () => controllernum.clear(),
        icon: Icon(Icons.clear),
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: Colors.blue)),
    );
  }

  /*NOTE:
  * each text field will get it's own validator, right now the only one is defined for the 'dream title' field*/
  return Builder(
    builder: (context) =>
        Form( //contains all logical stuff
          key: _formKey , //will be using formkey to get access to form data
          child: Column( //container for all our form fields to be aligned vertically
            children: [
              TextFormField(
                decoration: baselineInputDecorator("What shall we call your dream?",
                "'Josh Singing Kpop'", _control1),
                controller: _control1,
                validator: (String value) { //template validator method, this is title specific
                  if (value.isEmpty) {
                    return 'Please enter a title.';
                  }else if (value.length > 30){
                    return 'More brief title needed';
                  }
                return null;
                }),

              TextFormField(
                decoration: baselineInputDecorator("Where were you?",
                    "'Federico's House'", _control2),
                controller: _control2,
              ),
              TextFormField(
                decoration: baselineInputDecorator("Who was with you?",
                    "'Kpop star IU'", _control3),
                controller: _control3, //controllers
              ) ,
              Container(
                padding: const EdgeInsets.fromLTRB(0 , 50 , 0 , 20) ,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: headingcolor
                    ),
                    text: "What emotions did you experience? Press all that apply:",
                  )
                )
              ),
            ] ,
          ) ,
        ) ,
  );
}


/*All the code for the emotion buttons. */
class buttonEmotionBuilder extends StatefulWidget{
  _ButtonEmotionState createState() => _ButtonEmotionState();
}

class _ButtonEmotionState extends State<buttonEmotionBuilder>{

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

  @override
  void initState() {
    super.initState();
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
    return GridView.builder(
      padding: const EdgeInsets.all(18.0),  // padding from edge of screen
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,  // how many across
        childAspectRatio: 1.0,  //increase to make squashed
        crossAxisSpacing: 18.0, // this num and num below should be the same for padding
        mainAxisSpacing: 18.0,
      ),
      itemCount: buttonsList.length,
      itemBuilder: (context, i) => SizedBox(
        width: 100.0,
        height: 100.0,
        child: RaisedButton(
          padding: const EdgeInsets.all(18.0),
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0)),
          onPressed: buttonsList[i].enabled?()=>switchState(buttonsList[i]):null, // if the button is enabled, call switchState, else do null
          child: Text(
                buttonsList[i].activeText,
                style: TextStyle(color: Colors.limeAccent,
                    fontSize: 40.0)),
          color: buttonsList[i].bg,
          disabledColor: buttonsList[i].bg,
        ),
      ),
    );
  }
}
