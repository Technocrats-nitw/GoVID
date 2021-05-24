import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:technocrats/constants.dart';
import 'package:flutter/material.dart';
import 'package:technocrats/constants.dart';
import 'package:technocrats/screens/side_nav.dart';

class DocInfoPage extends StatelessWidget {
  DocInfoPage({
    this.docname,
  });
  String docname = "Dr. Prashant Sinha";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir',
      ),
      home: docInfoPage(
        docname: this.docname,
      ),
    );
  }
}

class docInfoPage extends StatefulWidget {
  docInfoPage({
    this.docname,
  });
  String docname = "Dr. Prashant Sinha";
  @override
  _docInfoPageState createState() => _docInfoPageState(docname: this.docname);
}

class _docInfoPageState extends State<docInfoPage> {
  _docInfoPageState({
    this.docname,
  });
  String docname = "Dr. Prashant Sinha";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        //title: Text('Side menu'),
      ),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Container>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: purpleGradient,
                /*LinearGradient(
                colors: [getStartedColorStart, getStartedColorEnd],
                begin: Alignment(0, -1.15),
                end: Alignment(0, 0.1),
              )*/
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Image.asset('assets/images/docinfo/bg1.png'),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      color: bgColor,
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset(
                                      'assets/images/docprofile/doc1.png'),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      (docname == null)
                                          ? "Dr Prashant Sinha"
                                          : docname,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      "Heart Surgeon - CK Hospital",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                    //RatingBar.builder(itemBuilder: itemBuilder, onRatingUpdate: onRatingUpdate)
                                  ],
                                )
                              ],
                            ),
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "About",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Please write the description of the doctor here. This will be a detailed information about the doctor and the roles and achievements that the doctor has had over the past years",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  /*Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25.0),
                                    child: Row(
                                      children: <Widget>[
                                        //Container(),
                                        Stats(name: "Patients", total: 352),
                                        //Spacer(),
                                        //Spacer(),
                                        Stats(
                                            name: "Certifications", total: 31),
                                      ],
                                    ),
                                  ),*/
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Available Time Slots",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SingleChildScrollView(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                        timeSlotWidget(
                                            "13",
                                            "MAY",
                                            "Consultation",
                                            "Sunday 9 am to 11.30 am"),
                                        timeSlotWidget(
                                            "14",
                                            "MAY",
                                            "Consultation",
                                            "Monday 10 am to 12.30 am"),
                                        timeSlotWidget(
                                            "1",
                                            "JUN",
                                            "Consultation",
                                            "Wednesday 8 am to 12.30 pm"),
                                        timeSlotWidget(
                                            "3",
                                            "JUN",
                                            "Consultation",
                                            "Friday 8 am to 1 am"),
                                      ])),
                                  /*
                            timeSlotWidget("13", "MAY", "Consultation",
                                "Sunday 9 am to 11.30 am"),
                            timeSlotWidget("14", "MAY", "Consultation",
                                "Monday 10 am to 12.30 am"),
                            timeSlotWidget("1", "JUN", "Consultation",
                                "Wednesday 8 am to 12.30 pm"),
                            timeSlotWidget("3", "JUN", "Consultation",
                                "Friday 8 am to 1 am"),
                                */
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container timeSlotWidget(
      String date, String month, String slotType, String time) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: docContentBgColor),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Container(
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: dateBgColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "$date",
                    style: TextStyle(
                        color: dateColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "$month",
                    style: TextStyle(
                        color: dateColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "$slotType",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "$time",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
/*

class Stats extends StatelessElement {
  String total, name;
  Stats({this.total = 342, this.name = "Patients"});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
            text: "$total\n",
            style: kTitleStyle,
          ),
          TextSpan(
            text: "$name",
            style: kSubtitleStyle.copyWith(fontSize: 14.0),
          ),
        ]));
  }
}
*/
