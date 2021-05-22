/*
Author : Ashiqa Rahman & Anshuman Mishra
Team :technocrats 
National Institute of Technology , Warangal */

import 'package:technocrats/constants.dart';
import 'package:technocrats/Start.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hackon With Amazon',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: Start(),
    );
  }
}
