import 'package:flutter/material.dart';
import 'package:technocrats/screens/side_nav.dart';

void main() => runApp(PagesHospital());

class PagesHospital extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Hospital side'),
          backgroundColor: Color(0xFF2A0B35),
        ),
        drawer: NavDrawer(),
        body: Center(
          child: Text('Hello mai hu hospital ka malik'),
        ),
      ),
    );
  }
}
