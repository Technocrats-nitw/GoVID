/*
Author : Ashiqa Rahman
Team :technocrats
National Institute of Technology Warangal
*/

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:technocrats/constants.dart';
import 'package:technocrats/widgets/card_items.dart';
import 'package:technocrats/widgets/card_main.dart';
import 'package:technocrats/widgets/card_section.dart';
import 'package:technocrats/widgets/custom_clipper.dart';
import 'package:technocrats/screens/side_nav.dart';
import 'package:technocrats/widgets/button_widget_qr.dart';
import 'package:technocrats/page/qr_create_page.dart';
import 'package:technocrats/screens/chat/chat_screen_doctor.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      appBar: AppBar(
        backgroundColor: Color(0xFF2A0B35), //Theme.of(context).accentColor,
      ),
      drawer: NavDrawer(),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyCustomClipper(clipType: ClipType.bottom),
            child: Container(
              color: Theme.of(context).accentColor,
              height: Constants.headerHeight + statusBarHeight,
            ),
          ),
          Positioned(
            right: -45,
            top: -30,
            child: ClipOval(
              child: Container(
                color: Colors.black.withOpacity(0.05),
                height: 220,
                width: 220,
              ),
            ),
          ),

          // BODY
          Padding(
            padding: EdgeInsets.all(Constants.paddingSide),
            child: ListView(
              children: <Widget>[
                // Header - Greetings and Avatar
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Good Morning,\nPatient",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                    ),
                    CircleAvatar(
                        radius: 26.0,
                        backgroundImage:
                            AssetImage('assets/icons/profile_picture.png'))
                  ],
                ),

                SizedBox(height: 50),

                // Main Cards - Heartbeat and Blood Pressure
                Container(
                  height: 140,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      CardMain(
                        image: AssetImage('assets/icons/heartbeat.png'),
                        title: "Hearbeat",
                        value: "66",
                        unit: "bpm",
                        color: Constants.lightPurple,
                      ),
                      CardMain(
                          image: AssetImage('assets/icons/blooddrop.png'),
                          title: "Blood Pressure",
                          value: "66/123",
                          unit: "mmHg",
                          color: Constants.darkPink)
                    ],
                  ),
                ),

                // Section Cards - Daily Medication
                SizedBox(height: 50),

                Text(
                  "YOUR DAILY MEDICATIONS",
                  style: TextStyle(
                    color: Constants.textPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 20),

                Container(
                    height: 125,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        CardSection(
                          image: AssetImage('assets/icons/capsule.png'),
                          title: "Amoxicillin",
                          value: "2",
                          unit: "pills",
                          time: "6-7AM",
                          link:
                              ('https://www.amazon.com/Amoxicillin-Dr-Grace-Francis/dp/4224649942?tag='),
                        ),
                        CardSection(
                          image: AssetImage('assets/icons/syringe.png'),
                          title: "Loratadine",
                          value: "1",
                          unit: "shot",
                          time: "8-9AM",
                          link:
                              'https://www.amazon.com/Claritin-Claritin%C2%AE-Non-Drowsy-90-tablets/dp/B000EWKVA8?tag=',
                        )
                      ],
                    )),

                SizedBox(height: 50),
                SizedBox(height: 20),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF2A0B35)),
                  ),
                  onPressed: () {
                    //debugPrint("CARD main clicked. redirect to details page");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreen()),
                    );
                  },
                  child: Text(
                    'Chat',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                SizedBox(height: 20),
                ButtonWidget(
                  color: Colors.cyan,
                  text: 'QR med report',
                  onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => QRCreatePage(),
                  )),
                ),
                SizedBox(height: 20),
                // Scheduled Activities
                Text(
                  "MEDICAL HISTORY",
                  style: TextStyle(
                      color: Constants.textPrimary,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 20),

                Container(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      CardItems(
                        image: Image.asset(
                          'assets/icons/lung.png',
                        ),
                        title: "Acute Bronchitis",
                        date: "25,April,2021",
                        type: "Diagnosis : By Dr. Ravi",
                        color: Constants.lightYellow,
                      ),
                      CardItems(
                        image: Image.asset(
                          'assets/icons/health-check.png',
                        ),
                        title: "RT-PCR Test",
                        date: "20,March,2021",
                        type: "Testing : Negative",
                        color: Constants.lightBlue,
                      ),
                      /*
                      ButtonWidget(
                        color: Colors.cyan,
                        text: 'QR med report',
                        onClicked: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => QRCreatePage(),
                        )),
                      ),*/
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
