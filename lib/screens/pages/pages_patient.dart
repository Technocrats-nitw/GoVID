import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:technocrats/screens/dev_ui/dev.dart';
import 'package:technocrats/screens/hospital_ui/hospitaldoctor.dart';
import 'package:technocrats/screens/acc_ui/account.dart';
import 'package:technocrats/views/links/twitter_screen.dart';

class PagesPatient extends StatefulWidget {
  //const Pages({Key key}) : super(key: key);

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
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device

    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          //TabScreen1(),
          TwitterScreen(),
          hospitaldoctor(),
          devUi(),
          Account(),
        ],
        onPageChanged: (int index) {
          setState(() {
            _pageController.jumpToPage(index);
          });
        },
      ),
      // covid , doctor,hospital, self_history
      bottomNavigationBar: CurvedNavigationBar(
          items: <Widget>[
            Icon(Icons.medical_services_outlined,
                size: 20, color: Colors.black),
            Icon(Icons.map_sharp, size: 20, color: Colors.black),
            Icon(Icons.medical_services_outlined,
                size: 20, color: Colors.black),
            Icon(Icons.account_circle_outlined, size: 20, color: Colors.black),
          ],
          animationDuration: Duration(milliseconds: 400),
          backgroundColor: Color.fromRGBO(245, 235, 201, 255),
          buttonBackgroundColor: Color.fromRGBO(245, 235, 201, 255),
          index: 0,
          onTap: (index) {
            setState(() {
              _pageController.jumpToPage(index);
            });
          }),
    );
  }
}
