
import 'package:dreamjournal/homepage.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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

