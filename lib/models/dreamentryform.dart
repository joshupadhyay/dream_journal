import 'package:DreamJournal/ui/ButtonList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'dreamentryclass.dart';
import '../pages/dreamlogpage.dart';

///DreamEntryForm is the parent class for creating add and edit dream entry pages (adddreampage.dart, editdreampage.dart)

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

  DreamEntryForm(this.title, this.submissionKey, this.submit, this.dreamEntry) {
    //required args
    controlTitle = TextEditingController(text: dreamEntry.dreamTitle);
    controlLocation = TextEditingController(text: dreamEntry.dreamLocation);
    controlPeople = TextEditingController(text: dreamEntry.dreamPeople);

    //checks if a date has been declared (if editing a dream), else grabs current date
    dreamEntry.date != null
        ? dateSet = dreamEntry.date
        : dateSet = DateTime.now();
    bl = ButtonList(dreamEntry);
  }

  @override
  _DreamEntryFormState createState() => _DreamEntryFormState();
}

class _DreamEntryFormState extends State<DreamEntryForm> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/Aidan_BG_Muted.jpg", //background image
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(title: Text(widget.title), centerTitle: true),
            body: Column(children: <Widget>[
              dateSelect(context),

              ///date entry button and calendar functionality

              textBuilder(context),

              ///builds all the forms and text on the page

              ///buttonlist
              Flexible(child: widget.bl, flex: 4),

              ///submission button
              Flexible(
                child: Center(child: submissionButton(context)),
                flex: 2, //submission button
              ),
            ]))
      ],
    );
  }

  Widget textBuilder(BuildContext context) {
    var mqbuffer =
        MediaQuery.of(context).size.width * 0.03; //to standardize padding

    ///Widget that determines what each TextField looks like, by default.
    Widget questionLayout(String passedQuestionText, String passedHintText,
        TextEditingController passedController,
        {passedValidator = null}) {
      //not all fields use a validator
      return new Container(
          margin: EdgeInsets.fromLTRB(
              mqbuffer, mqbuffer * .2, mqbuffer, mqbuffer * .2),
          child: TextFormField(
              style: TextStyle(
                  // style for input text
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
              maxLength: 30,
              //to limit text entry length
              controller: passedController,
              validator: passedValidator,
              decoration: InputDecoration(
                  labelText: passedQuestionText,
                  labelStyle: TextStyle(
                      color: Colors.greenAccent,
                      //used to set question colors, style
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                  hintText: passedHintText,
                  hintStyle: TextStyle(
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                    color: Colors.greenAccent.withOpacity(0.7),
                  ),
                  suffixIcon: IconButton(
                      //x button to clear data from given textfield
                      icon: Icon(Icons.clear),
                      onPressed: () => passedController.clear()))));
    }

    ///what actually builds the textfields
    return Column(
      children: <Widget>[
        Builder(
            builder: (context) => Form(
                  //contains all logical stuff
                  key: widget.submissionKey,
                  //will be using formkey to get access to form data
                  child: Column(
                    //for all our form fields to be aligned vertically

                    children: [
                      questionLayout(
                          "What's your dream called?",
                          "'Josh Singing Kpop'",
                          widget.controlTitle, passedValidator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter a title.'; //validator method, as title is the only one we need non-null
                        }
                        return null;
                      }),
                      questionLayout("Who did you meet?",
                          "'Josh, Kpop Star IU'", widget.controlPeople),
                      questionLayout("Where were you?", "'My apartment'",
                          widget.controlLocation),
                    ],
                  ),
                )),

        //text above buttonlist

        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "What emotion(s) did you feel? Tap to select.",
                style: TextStyle(
                    color: Colors.greenAccent,
                    //used to set question colors, style
                    fontStyle: FontStyle.italic,
                    fontSize: 17))),
        SizedBox(
          width: MediaQuery.of(context).size.height * 0.14,
        )
      ],
    );
  }

  ///builds the calendar pressable widget

  Widget dateSelect(BuildContext context) {
    var dateformat = new DateFormat('MMMMd'); //for nice date formatting

    return Column(
      children: <Widget>[
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "Tap to change dream date.",
                style: TextStyle(
                    color: Colors.greenAccent,
                    //used to set question colors, style
                    fontStyle: FontStyle.italic,
                    fontSize: 13))),
        RaisedButton.icon(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          label: Text(dateformat.format(widget.dateSet),
              //formatting for how the calendar font shows up in the page
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black)),
          icon: Icon(Icons.calendar_today),
          color: Colors.lightBlue,

          ///to change background color of calendar text
          onPressed: () {
            _popupSelectDate(context);
          },
        )
      ],
    );
  }

  ///Calendar pop-up once calendar button is selected.
  Future<void> _popupSelectDate(BuildContext context) async {
    DateTime datePicked = await showDatePicker(
        context: context,
        initialDate: widget.dateSet,
        firstDate: DateTime(2019, 2),
        lastDate: DateTime.now());
    if (datePicked != null) {
      setState(() {
        widget.dateSet = datePicked;
      });
    }
  }

  int boolToInt(bool a) => a == false ? 0 : 1;

  //to cast booleans as ints to store clicked emotions in database

  Widget submissionButton(BuildContext context) {
    return SizedBox(
        //used for setting dimensions of button
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.06,
        child: RaisedButton(
          //submission button parameters

          color: Colors.pinkAccent,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),

          //text shown on submitbutton
          child: Text('SUBMIT',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black87)),

          onPressed: () {
            widget.dreamEntry.dreamPeople = widget.controlPeople.text;
            widget.dreamEntry.dreamTitle = widget.controlTitle.text;
            widget.dreamEntry.dreamLocation = widget.controlLocation.text;
            widget.dreamEntry.isAngry = boolToInt(widget.bl.buttonsList[0].on);
            widget.dreamEntry.isEmbarassed =
                boolToInt(widget.bl.buttonsList[1].on);
            widget.dreamEntry.isContemplative =
                boolToInt(widget.bl.buttonsList[2].on);
            widget.dreamEntry.isExcited =
                boolToInt(widget.bl.buttonsList[3].on);
            widget.dreamEntry.isHappy = boolToInt(widget.bl.buttonsList[4].on);
            widget.dreamEntry.isCool = boolToInt(widget.bl.buttonsList[5].on);
            widget.dreamEntry.isSad = boolToInt(widget.bl.buttonsList[6].on);
            widget.dreamEntry.isScared = boolToInt(widget.bl.buttonsList[7].on);
            widget.dreamEntry.date = widget
                .dateSet; //date is stored in dreamentry class as a DateTime Object

            if (widget.submit(widget.submissionKey) == true) {
              ///specific submission functions are in adddreampage, editdreampage (widget.submit)
              return Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new DreamLog()));
              //if all OK submitting, open recent dreams page (successful submit only, validator will catch errors otherwise)
            }
            return null;
          },
        ));
  }
}
