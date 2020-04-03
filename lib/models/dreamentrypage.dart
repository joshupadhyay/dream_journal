import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'emotebuttonbuilder.dart';
import '../recentdreams.dart';


/*
DreamEntryForm is the class for creating add and edit dream entry pages (adddreampage, editdreampage)
 */

class DreamEntryForm extends StatefulWidget {
  final String title;
  final GlobalKey submissionKey;
  final Function submit;

  DreamEntryForm(this.title, this.submissionKey,
      this.submit); //required args

  @override
  _DreamEntryFormState createState() => _DreamEntryFormState();

}

class _DreamEntryFormState extends State<DreamEntryForm>{

  var dateformat = new DateFormat('MMMMd'); //for nice date formatting
  DateTime _datetime = DateTime.now(); //to display today's date by default

  /*wherever you see widget.(something), like widget.title,
  that's a parameter that's passed from the DreamEntryForm constructor defined above!
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title) , centerTitle: true ,) ,
        body: Column(
            children: <Widget>[OutlineButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)) ,
                child: Text('Date: ${dateformat.format(_datetime)}' ,
                    //formatting today's date to show in button
                    style: TextStyle(
                        fontWeight: FontWeight.bold ,
                        fontSize: 14 ,
                        color: Colors.teal)) ,
                onPressed: () {
                  showDatePicker(context: context ,
                      initialDate: DateTime.now() ,
                      firstDate: DateTime(2020) ,
                      lastDate: DateTime(2025)).then((date) {
                    setState(() {
                      _datetime = date;
                    });
                  });
                }) ,
              /*Date Button widget ends right here*/

              textFieldsBuilder(context) , //controls each of the textfields, see that widget below

              new Flexible(
                child: buttonEmotionBuilder() , flex: 5 ,) ,
              new Flexible(
                  child: RaisedButton(//submission button

                      onPressed: () {
                        if (widget.submit(widget.submissionKey) == true) {
                          return Navigator.push(context ,
                              new MaterialPageRoute(
                                  builder: (context) => new RecentDreams()));
                          //if all OK submitting, open recent dreams page (successful submit only, validator will catch errors otherwise)
                        }
                        return null;
                      } ,
                      child: Text('submit')) , flex: 1) ,
            ])
      //the other widgets!
      //TODO add borders, make the scrolling look nicer
    );
  }

  Widget textFieldsBuilder (BuildContext context) {
    final headingcolor = Colors.lightBlue; //used in TextStyle() and InputDecoration() to set question colors

    final _control1 = TextEditingController();
    final _control2 = TextEditingController();
    final _control3 = TextEditingController();

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
            key: widget.submissionKey , //will be using formkey to get access to form data
            child: Column( //container for all our form fields to be aligned vertically
              children: [
                TextFormField(
                    decoration: baselineInputDecorator("What shall we call your dream?",
                        "'Josh Singing Kpop'", _control1),
                    controller: _control1,

//                    validator: (String value) { //template validator method, this is title specific
//                      if (value.isEmpty) {
//                        return 'Please enter a title.';
//                      }else if (value.length > 30){
//                        return 'Shorter title needed.';
//                      }
//                      return null;
//                    }
                    ),

                TextFormField(
                  decoration: baselineInputDecorator("Where were you?",
                      "'Federico's House'", _control2),
                  controller: _control2,

//                  validator: (String value) {
//                    if (value.isEmpty) {
//                      return 'Please enter location(s).';
//                    }else if (value.length > 30){
//                      return 'Shorter entry please!';
//                    }
//                    return null;
//                  },
                  ),

                TextFormField(
                  decoration: baselineInputDecorator("Who was with you?",
                      "'Kpop star IU'", _control3),
                  controller: _control3,
//                  validator: (String value) {
//                    if (value.isEmpty) {
//                      return 'Please enter a name.';
//                    }else if (value.length > 30){
//                      return 'Shorter / less names please!';
//                    }
//                    return null;
//                  }

                  ),

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
}


