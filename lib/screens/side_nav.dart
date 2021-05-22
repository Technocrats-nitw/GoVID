import 'package:flutter/material.dart';
import 'package:technocrats/constants.dart';
import 'package:technocrats/Start.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:technocrats/screens/acc_ui/account.dart';
import 'package:technocrats/screens/twitter_screen.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Start()),
        );
      }
    });
  }

  signOut() async {
    _auth.signOut();
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
    //this.getUser();
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
              style: TextStyle(color: Colors.white, fontSize: 25),
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
            title: Text('Twitter Search'),
            onTap: () {
              //debugPrint("CARD main clicked. redirect to details page");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TwitterScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () {
              //debugPrint("CARD main clicked. redirect to details page");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Account()),
              );
            },
          ),
          ListTile(
              leading: Icon(Icons.border_color),
              title: Text('Feedback'),
              onTap: () => {} //() => {Navigator.of(context).pop()},
              ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              signOut();
            },
          ),
        ],
      ),
    );
  }
}
