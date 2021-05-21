import 'package:flutter/material.dart';

void main() => runApp(PagesHospital());

class PagesHospital extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Hospital side'),
        ),
        body: Center(
          child: Text('Hello mai hu hospital ka malik'),
        ),
      ),
    );
  }
}
