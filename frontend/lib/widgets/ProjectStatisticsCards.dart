import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProjectStatisticsCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      height: 120.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          SizedBox(width: 10),
          ProjectStatisticsCard(
            count: '125',
            name: 'All finished projects',
            descriptions: '2 projects out of time',
            progress: 0.75,
            progressString: '75%',
            color: Color(0xffFAAA1E),
          ),
          ProjectStatisticsCard(
            color: Color(0xff6C6CE5),
            count: '1105',
            name: 'Patient turnout',
            descriptions: '+ 576 new visitors',
            progress: 0.68,
            progressString: '68%',
          ),
        ],
      ),
    );
  }
}

class ProjectStatisticsCard extends StatelessWidget {
  final String count;
  final String name;
  final String descriptions;
  final double progress;
  final String progressString;
  final Color color;

  ProjectStatisticsCard({
    @required this.count,
    @required this.descriptions,
    @required this.name,
    @required this.progress,
    @required this.progressString,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0, left: 20.0, right: 20.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        height: 85.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    count,
                    style: GoogleFonts.quicksand(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    name,
                    style: GoogleFonts.quicksand(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    descriptions,
                    style: GoogleFonts.quicksand(
                      fontSize: 10.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            CircularPercentIndicator(
              radius: 55.0,
              lineWidth: 4.5,
              percent: progress,
              circularStrokeCap: CircularStrokeCap.round,
              center: Text(
                progressString,
                style: GoogleFonts.quicksand(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              progressColor: Colors.white,
              startAngle: 270,
              backgroundColor: Colors.white54,
            ),
          ],
        ),
      ),
    );
  }
}
