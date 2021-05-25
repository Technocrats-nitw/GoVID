import 'package:flutter/material.dart';
import 'package:technocrats/screens/side_nav.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:technocrats/screens/tabscreen1.dart';
import 'package:technocrats/screens/amz_health_cntr/amz_screen.dart';

class PagesDoc extends StatefulWidget {
  //const Pages({Key key}) : super(key: key);

  @override
  _PagesDocState createState() => _PagesDocState();
}

class _PagesDocState extends State<PagesDoc> {
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
          TabScreen1(),
          TabScreen1(),
          TabScreen1(),
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
            //Icon(Icons.medical_services_outlined,
            //size: 20, color: Colors.black),
            Icon(Icons.map_sharp, size: 20, color: Colors.black),
            Icon(Icons.medical_services_outlined,
                size: 20, color: Colors.black),
            //Icon(Icons.account_circle_outlined, size: 20, color: Colors.black),
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
