/*
Author :
Anshuman Mishra
Team :technocrats
National Institute of Technology Warangal
*/

import 'package:flutter/material.dart';
import 'package:technocrats/utils/constants.dart';
import 'package:technocrats/screens/side_nav.dart';

class devUi extends StatefulWidget {
  final String title = "";

  @override
  _devUiState createState() => _devUiState();
}

class _devUiState extends State<devUi> {
  int _selectedIndex = 0;

  void onTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(44, 24, 83, 255),
      appBar: AppBar(
        backgroundColor: Color(0xFF2A0B35),
      ),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.topCenter,
              overflow: Overflow.visible,
              children: <Widget>[
                _backBgCover(),
                _greetings(),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            SingleChildScrollView(
              child: Column(
                children: <Container>[
                  Container(
                    height: 500,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          createDevWidget("Ashiqa Rahman.jpeg", "Ashiqa Rahman",
                              "Frontend Android Developer\nPenetration Tester at Cybsec NITW"),
                          createDevWidget(
                              "Anshuman Mishra.jpeg",
                              "Anshuman Mishra",
                              "Frontend Flutter\nStudent ML Researcher at Nevronas NITW"),
                          createDevWidget(
                              "Mohd Sufiyan Ansari.jpeg",
                              "Mohd. Sufiyan Ansari",
                              "Backend & DBMS\nWeb Developer at WSDC NITW"),
                          createDevWidget(
                              "Chaitanya Hardikar.jpeg",
                              "Chaitanya Hardikar",
                              "Backend & DBMS\nStudent ML Researcher at Nevronas NITW"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    /*
    return Scaffold(
      backgroundColor: bgColor,
      body: 
          
          
          
          Stack(
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.topCenter,
            overflow: Overflow.visible,
            children: <Widget>[
              _backBgCover(),
              _greetings(),
            ],
          ),
          SizedBox(
            height: 50.0,
          ),
          Text(
            "Chief Doctors",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),

      
      
      
    );*/
  }

  Container createDevWidget(String imgName, String devName, String about) {
    return Container(
      child: InkWell(
        child: Container(
          margin: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            color: docContentBgColor,
          ),
          child: Container(
            padding: EdgeInsets.all(7),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 70,
                  height: 90,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/dev/$imgName'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "$devName",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 250,
                      height: 50,
                      child: Text(
                        "$about",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        onTap: openDocInfo,
      ),
    );
  }

  void openDocInfo() {
    Navigator.pushNamed(context, '/DocInfo');
  }

  Positioned _greetings() {
    return Positioned(
      left: 20,
      bottom: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Team Technocrats',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'National Institute of Technology Warangal',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Container _backBgCover() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .25,
      decoration: BoxDecoration(
        gradient: purpleGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
    );
  }
}
