
import 'package:DreamJournal/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([ // adds orientation lock
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Dream Journal UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.orange[600], //appbar color
        accentColor: Color(0xFFB39DDB), //
        scaffoldBackgroundColor: Color.fromRGBO(255,102,153,0.85),

      ),
      home: HomePage()
    );
  }
}

