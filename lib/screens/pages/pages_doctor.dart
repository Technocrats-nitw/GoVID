import 'package:flutter/material.dart';

void main() => runApp(PagesDoc());

class PagesDoc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Doctor side'),
        ),
        body: Center(
          child: Text('Hello mai munnabhai mbbs'),
        ),
      ),
    );
  }
}
