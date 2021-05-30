/*
Author:
Anshuman Mishra
Technocrats NITW
*/

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:technocrats/screens/patient_ui/covid_ui/covid.dart';
import 'package:technocrats/screens/patient_ui/nearby_hosp_doc/hospitals.dart';
import 'package:technocrats/screens/patient_ui/twitter_screen.dart';

class PagesPatient extends StatefulWidget {
  @override
  _PagesPatientState createState() => _PagesPatientState();
}

class _PagesPatientState extends State<PagesPatient> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Dashboard(),
          hospitalList(),
          TwitterScreen(),
        ],
        onPageChanged: (int index) {
          setState(() {
            _pageController.jumpToPage(index);
          });
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
          items: <Widget>[
            Icon(Icons.medical_services_outlined,
                size: 20, color: Colors.black),
            Icon(Icons.map_sharp, size: 20, color: Colors.black),
            Icon(Icons.medical_services_outlined,
                size: 20, color: Colors.black),
          ],
          animationDuration: Duration(milliseconds: 400),
          backgroundColor: Color(0xFF2A0B35),
          buttonBackgroundColor: Colors.white,
          index: 0,
          onTap: (index) {
            setState(() {
              _pageController.jumpToPage(index);
            });
          }),
    );
  }
}
