import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/dbmanager.dart';
import 'models/dreamentry.dart';
import 'editdreampage.dart';


/*
Page for showing saved / recent dream entries
 */

class RecentDreams extends StatefulWidget {
  @override
  _RecentDreamsState createState() => _RecentDreamsState();
}

//Future<List<DreamEntry>> fetchDreamEntries() async{
//  var dbmanager = new DBManager();
//  List<DreamEntry> dreamentries = await dbmanager.dreamList();
//  //print(dreamentries[0].dreamTitle.toString());
//}

//**to download a file**


class _RecentDreamsState extends State<RecentDreams> {
  DBManager dbmanager = DBManager();

  // List<DreamEntry> dreamentries;
  Future data;

  @override
  void initState() {
    super.initState();
    data = showdreams();
  }

  Future <void> showdreams() async {
    dbmanager = this.dbmanager;
    List<DreamEntry> dreamlisted = await dbmanager.dreamList();
    return dreamlisted;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Recent Dreams'),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: data,
            builder: (_, dream_entry) {
              switch (dream_entry.connectionState) {
                case ConnectionState.none:
                  return Container();
                case ConnectionState.waiting:
                  return Container();
                case ConnectionState.active:
                case ConnectionState.done:
                  return ListView.builder(
                      itemCount: dream_entry.data.length,
                      itemBuilder: (context, index){
                        DreamEntry dreamEntry = dream_entry.data[index];
                        return Column(
                            children: dream_entry.data.map<Widget>((dreamentry) => dreamTemplate(dreamentry)).toList()
                        );

                  },
                  );

              }
            }
        )
    );
  }

  //children: dreamentries.map((dreamentry) => dreamTemplate(dreamentry)).toList()


  //code for the text above the dream entry cards
  Widget _helptext() {
    return Container(
      child: Text("Tap on any of the entries to edit them!",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.greenAccent
          )),
    );
  }


//  Currently just a list of dream summaries, based on dreamentry class

//  List <DreamEntry> dreamentries = [
//    DreamEntry(isHappy: 1,
//        dreamTitle: 'Singing Kareoke',
//        dreamPeople: 'Josh, Federico, IU'),][
//
//    DreamEntry(isHappy: 1,
//        dreamTitle: 'Missed Flight and Granola',
//        dreamPeople: 'Josh, Liam, Shafim'),
//    DreamEntry(isHappy: 1,
//        dreamTitle: 'Getting Stuck in the Basement, Parasite House ',
//        dreamPeople: "Josh, Josh's Family, Izzy"),
//  ];

  expands(AsyncSnapshot dream_entry) {

  }


  //card template for displaying entries

  Widget dreamTemplate(dreamentry) {
    return
      Center(
          child: Container(
              width: 390,
              height: 70,
              child: Card(
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)
                  ),

                  child: FlatButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => EditDreamPage() //index add
                            ));
                      },
                      child: Column(
                        children: <Widget>[
                          Flexible(
                              child: Text(
                                  dreamentry.dreamTitle.toString(),
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.blue,
                                  ))),
                          Flexible(
                              child: SizedBox(height: 6))
                          ,
                          Flexible(
                              child: Text(
                                  dreamentry.dreamPeople.toString(),
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.teal
                                  )
                              ))
                        ],
                      )))));
  }




//  void _delete(BuildContext context, DreamEntry DreamEntry) async {
//
//    int result = await DBManager.deleteDream();
//    if (result != 0) {
//      _showSnackBar(context, 'DreamEntry Deleted Successfully');
//      updateListView();
//    }
//  }
//
//  void _showSnackBar(BuildContext context, String message) {
//
//    final snackBar = SnackBar(content: Text(message));
//    Scaffold.of(context).showSnackBar(snackBar);
//  }
//
//  void navigateToDetail(DreamEntry DreamEntry, String title) async {
//    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
//      return DreamEntryDetail(DreamEntry, title);
//    }));
//
//    if (result == true) {
//      updateListView();
//    }
//  }
//
//  void updateListView() {
//
//    final Future<Database> dbFuture = DBManager.initializeDatabase();
//    dbFuture.then((database) {
//
//      Future<List<DreamEntry>> DreamEntryListFuture = DBManager.getDreamEntryList();
//      DreamEntryListFuture.then((DreamEntryList) {
//        setState(() {
//          this.DreamEntryList = DreamEntryList;
//          this.count = DreamEntryList.length;
//        });
//      });
//    });
//  }
}