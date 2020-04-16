import 'package:dreamjournal/adddreampage.dart';
import 'package:dreamjournal/homepage.dart';
import 'package:dreamjournal/recentdreams.dart';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dream Journal UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
        accentColor: Color(0xFFB39DDB),
        scaffoldBackgroundColor: Colors.grey[600],

      ),
      home: HomePage(),//change this to see how your page is... def some way to show other pages without home!
    );
  }
}

