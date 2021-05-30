/*
Author :
Anshuman Mishra
Ashiqa Rahman
NIT Warangal
*/
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    @required this.text,
    @required this.onClicked,
  });

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(52),
          primary: Colors.indigo[700],
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        onPressed: onClicked,
      );
}
