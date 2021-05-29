import 'package:flutter/material.dart';
import 'package:technocrats/utils/constants.dart';
import 'package:technocrats/screens/patient_ui/profile/med_report.dart';
import 'package:technocrats/screens/dev_ui/dev.dart';
import 'package:technocrats/action_page/home_page.dart';

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
            decoration:
                /*BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/cover.jpg'))),*/

                BoxDecoration(
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
              //debugPrint("CARD main clicked. redirect to details page");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => devUi()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_view_day),
            title: Text('Calender'),
            onTap: () {
              //debugPrint("CARD main clicked. redirect to details page");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Account()),
              );
            },
          ),
          ListTile(
              leading: Icon(Icons.medical_services),
              title: Text('Vaccine Cell'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              }),
          ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              }),
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
