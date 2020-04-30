import 'package:dreamjournal/ui/ButtonList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dreamentryclass.dart';
import '../recentdreams.dart';


///DreamEntryForm is the class for creating add and edit dream entry pages (adddreampage, editdreampage)


class DreamEntryForm extends StatefulWidget {
  final String title;
  final GlobalKey submissionKey;
  final Function submit;
  final DreamEntryClass dreamEntry;
  TextEditingController controlTitle;
  TextEditingController controlLocation;
  TextEditingController controlPeople;
  DateTime dateSet;

  ButtonList bl;

  DreamEntryForm(this.title, this.submissionKey,
      this.submit, this.dreamEntry, this.bl)
  { //required args
        controlTitle = TextEditingController(text: dreamEntry.dreamTitle);
        controlLocation = TextEditingController(text: dreamEntry.dreamLocation);
        controlPeople = TextEditingController(text: dreamEntry.dreamPeople);

        //checks if a date has been declared (if editing a dream), else grabs current date
        dreamEntry.date != null ? dateSet = dreamEntry.date : dateSet = DateTime.now();

  }

  @override
  _DreamEntryFormState createState() => _DreamEntryFormState();

}

class _DreamEntryFormState extends State<DreamEntryForm>{

  /*wherever you see widget.(something), like widget.title,
  that's a parameter that's passed from the DreamEntryForm constructor defined above!
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title), centerTitle: true),
        body: Column(
            children: <Widget>[
              _calendarbutton(context), //date entry button and calendar functionality

              Center(
                child:
                textFieldsBuilder(context),
              ), //controls each of the textfields

              Flexible(
                //TODO add borders, make the scrolling look nicer
                  child: widget.bl, flex: 5 //controls emoji clicking
              ),

              Flexible(
                child:  Center(
                    child:_submissionbutton(context)
                ), flex: 1,//submission button

              ),
            ])
    );
  }



  Widget textFieldsBuilder (BuildContext context) {

    final headingcolor = Colors.greenAccent; //used in TextStyle() and InputDecoration() to set question colors

    //determines what headers, hints look like for textfield entry
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
            key: widget.submissionKey,
            //will be using formkey to get access to form data
            child: Column( //container for all our form fields to be aligned vertically
              children: [

                Center(
                    child:
                    TextFormField(
                  decoration: baselineInputDecorator("What shall we call your dream?",
                      "'Josh Singing Kpop'", widget.controlTitle),
                  controller: widget.controlTitle,

                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter a title.';
                      }else if (value.length > 30){
                        return 'Shorter title needed.';
                      }
                      return null;
                    }
                )),


                Center(
                  child:
                  TextFormField(
                    decoration: baselineInputDecorator("Where were you?",
                        "'Federico's House'", widget.controlLocation),
                    controller: widget.controlLocation,

                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter location(s).';
                    }else if (value.length > 30){
                      return 'Shorter entry please!';
                    }
                    return null;
                  },
                  ),

                ),

                Center(
                  child:
                  TextFormField(
                    decoration: baselineInputDecorator("Who was with you?",
                        "'Kpop star IU'", widget.controlPeople),
                    controller: widget.controlPeople,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter a name.';
                    }else if (value.length > 30){
                      return 'Shorter / less names please!';
                    }
                    return null;
                  }
                  ),
                ),

                Container(
                    padding: const EdgeInsets.fromLTRB(0 , 50 , 0 , 20) ,
                    child: Center(
                        child:RichText(
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
                ),
              ] ,
            ) ,
          ) ,
    );
  }


  ///builds the calendar pressable widget

  Widget _calendarbutton(BuildContext context){
    var dateformat = new DateFormat('MMMMd'); //for nice date formatting

    return FlatButton(color: Colors.tealAccent,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)) ,
        child: Text('Date: ${dateformat.format(widget.dateSet)}' ,
            //formatting for how the calendar font shows up in the page
            style: TextStyle(
                fontWeight: FontWeight.bold ,
                fontSize: 14 ,
                color: Colors.black87)) ,
        onPressed: () {
          _popupSelectDate(context);
        });
  }

  ///Calendar pop-up once calendar button is selected.
  Future<void> _popupSelectDate(BuildContext context) async{

    DateTime date_picked = await showDatePicker(context: context,
        initialDate: widget.dateSet,
        firstDate: DateTime(2020,2),
        lastDate: DateTime(2025));
    if (date_picked != null){
          setState(() {
            widget.dateSet = date_picked;
          });
    }
  }

  int boolToInt(bool a) => a == false ? 0 : 1; //because for some reason we can't cast!

  Widget _submissionbutton(BuildContext context){

    return RaisedButton(//submission button
        onPressed: () {
          widget.dreamEntry.dreamPeople = widget.controlPeople.text;
          widget.dreamEntry.dreamTitle = widget.controlTitle.text;
          widget.dreamEntry.dreamLocation = widget.controlLocation.text;
          widget.dreamEntry.isAngry = boolToInt(widget.bl.buttonsList[0].on);
          widget.dreamEntry.isEmbarassed = boolToInt(widget.bl.buttonsList[1].on);
          widget.dreamEntry.isContemplative = boolToInt(widget.bl.buttonsList[2].on);
          widget.dreamEntry.isExcited = boolToInt(widget.bl.buttonsList[3].on);
          widget.dreamEntry.isHappy = boolToInt(widget.bl.buttonsList[4].on);
          widget.dreamEntry.isCool = boolToInt(widget.bl.buttonsList[5].on);
          widget.dreamEntry.isSad = boolToInt(widget.bl.buttonsList[6].on);
          widget.dreamEntry.isScared = boolToInt(widget.bl.buttonsList[7].on);
          widget.dreamEntry.date = widget.dateSet; //date is stored in dreamentry class as a DateTime Object

          if (widget.submit(widget.submissionKey) == true)  {

            ///Submission functions are in adddreampage, editdreampage (widget.submit)

            return Navigator.push(context ,
                new MaterialPageRoute(
                    builder: (context) => new RecentDreams()));
            //if all OK submitting, open recent dreams page (successful submit only, validator will catch errors otherwise)
          }
          return null;
        },

        //text shown on submitbutton
        child: Text('submit'));
  }



}


