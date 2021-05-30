/*
Author :
Chaitnya Hardikar
NIT Warangal
*/
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final Color color;
  const ButtonWidget({
    @required this.text,
    @required this.color,
    @required this.onClicked,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => RaisedButton(
        child: Text(
          text,
          style: TextStyle(fontSize: 14),
        ),
        shape: StadiumBorder(),
        color: color,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        textColor: Colors.white,
        onPressed: onClicked,
      );
}
