/*
Author :
Anshuman Mishra
NIT Warangal
*/
import 'package:flutter/material.dart';
import 'package:technocrats/utils/constants.dart';
import 'package:technocrats/screens/doctor_ui/patient_search.dart';
import 'package:technocrats/screens/dev_ui/dev.dart';
import 'package:technocrats/screens/account/home_page.dart';
import 'package:technocrats/screens/doctor_ui/qr_scan_page.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'GoVID',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 45),
            ),
            decoration: BoxDecoration(
              gradient: purpleGradient,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Developers info'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => devUi()),
              );
            },
          ),
          ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              }),
        ],
      ),
    );
  }
}
