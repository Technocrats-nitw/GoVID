import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:technocrats/widgets/ProjectProgressCard.dart';
import 'package:technocrats/widgets/ProjectStatisticsCards.dart';
import 'package:technocrats/widgets/SharedFilesItem.dart';
import 'package:technocrats/widgets/SubHeader.dart';
import 'package:technocrats/widgets/Tabs.dart';
import 'package:technocrats/utils/constants.dart';
import 'package:technocrats/Dashboard/side_nav.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      appBar: AppBar(
        //Title: Text('Hospital Dashboard'),
        backgroundColor: Theme.of(context).accentColor,
      ),
      drawer: NavDrawer(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        //   width: MediaQuery.of(context).size.width * 0.63,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30.0, top: 50.0, bottom: 10.0),
                  child: Text(
                    'HOSPITAL DASHBOARD',
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Tabs(),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  height: 200.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      SizedBox(width: 10),
                      ProjectProgressCard(
                        color: Color(0xffFF4C60),
                        projectName: 'Buy Equipment',
                        percentComplete: '34%',
                        progressIndicatorColor: Colors.redAccent,
                        icon: Feather.moon,
                      ),
                      SizedBox(width: 10),
                      ProjectProgressCard(
                        color: Color(0xff6C6CE5),
                        projectName: 'Vaccine Drive',
                        percentComplete: '78%',
                        progressIndicatorColor: Colors.blue,
                        icon: Feather.truck,
                      ),
                      SizedBox(width: 10),
                      ProjectProgressCard(
                        color: Color(0xffFAAA1E),
                        projectName: 'Build ICU',
                        percentComplete: '82%',
                        progressIndicatorColor: Colors.amber,
                        icon: Icons.local_airport,
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                SubHeader(
                  title: 'Shared Files',
                ),
                Container(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      SharedFilesItem(
                        color: Colors.blue,
                        sharedFileName: 'Hospital Guidelines',
                        fileSize: '2.3 MB',
                      ),
                      SizedBox(width: 10),
                      SharedFilesItem(
                        color: Colors.amber,
                        sharedFileName: 'Hospital Policy',
                        fileSize: '4.2 MB',
                      ),
                      SizedBox(width: 10),
                      SharedFilesItem(
                        color: Colors.red,
                        sharedFileName: 'Wireframes',
                        fileSize: '1.6 MB',
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                SubHeader(
                  title: 'Project Statistics',
                ),
                ProjectStatisticsCards(),
                SizedBox(width: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
