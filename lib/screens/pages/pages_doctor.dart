import 'package:flutter/material.dart';
import 'package:technocrats/screens/side_nav.dart';

void main() => runApp(PagesDoc());

class PagesDoc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Doctor's interface"),
          backgroundColor: Color(0xFF2A0B35),
        ),
        drawer: NavDrawer(),
        body: Center(
          child: Text('Hello mai hu munnabhai mbbs'),
        ),
      ),
    );
  }
}
