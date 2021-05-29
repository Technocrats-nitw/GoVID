import 'package:technocrats/model/data_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:technocrats/utils/constants.dart';
import 'package:technocrats/screens/amz_health_cntr/side_nav.dart';

class MobileScreen extends StatefulWidget {
  @override
  _MobileScreenState createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  final _data = FakeRepository.data;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Positioned greetings() {
    return Positioned(
      left: 30,
      bottom: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          /*Image.asset(
            "assets/images/covid/care.jpeg",
            height: 200.0,
          ),*/
          Text(
            'Amazon HealthCare \nCenter',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          Text(
            "Hyderabad",
            style: TextStyle(
                fontSize: 29, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          /*Text(
            'National Institute of Technology Warangal',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),*/
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (_, sizingInformation) {
        return Scaffold(
          key: scaffoldKey,
          drawer: NavDrawer(),
          appBar: AppBar(
            backgroundColor: Color(0xFF2A0B35),
            leading: GestureDetector(
                onTap: () {
                  scaffoldKey.currentState.openDrawer();
                },
                child: Icon(Icons.menu)),
            title: Text("Dashboard"),
            actions: [
              Icon(Icons.more_vert),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  overflow: Overflow.visible,
                  children: <Widget>[
                    _backBgCover(),
                    greetings(),
                  ],
                ),
                _row2by2Widget(sizingInformation),
                _gridListItems()
              ],
            ),
          ),
        );
      },
    );
    Positioned _greetings() {
      return Positioned(
        left: 30,
        bottom: 90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            /*Image.asset(
            "assets/images/covid/care.jpeg",
            height: 200.0,
          ),*/
            Text(
              'COVID 19 Emergency',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            /*Text(
            'National Institute of Technology Warangal',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),*/
          ],
        ),
      );
    }
  }

  Widget _gridListItems() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: _data.length,
        physics: ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.85),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 8, top: 8, bottom: 8, left: 4),
            padding: EdgeInsets.symmetric(horizontal: 28, vertical: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.2),
                  blurRadius: 2,
                  offset: Offset(0.5, 0.5),
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _data[index].serviceName,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      "In High Demand ",
                      style: TextStyle(color: Colors.red[600], fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Last Arr.",
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 12)),
                        Text(
                          _data[index].date,
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Time",
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 12)),
                        Text(
                          _data[index].time,
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Order Stock",
                      style: TextStyle(fontSize: 16, color: Colors.indigo),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _row2by2Widget(SizingInformation sizingInformation) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _singleItemQuickStats(
                  title: "Total Vaccine Stock",
                  value: "2834",
                  icon: Icons.medical_services_rounded,
                  width: sizingInformation.screenSize.width / 2.6,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _singleItemQuickStats(
                    title: "Pending orders",
                    value: "180",
                    icon: Icons.access_alarms_outlined,
                    width: sizingInformation.screenSize.width / 2.6,
                    textColor: Colors.red),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _singleItemQuickStats(
                    title: "Shipments",
                    value: "109",
                    icon: Icons.timelapse_sharp,
                    iconColor: Colors.green,
                    width: sizingInformation.screenSize.width / 2.6),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _singleItemQuickStats(
                  title: "Staff Details",
                  value: " x ",
                  icon: Icons.people,
                  iconColor: Colors.blueGrey,
                  width: sizingInformation.screenSize.width / 2.6,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _singleItemQuickStats(
      {String title,
      Color textColor = Colors.black,
      String value,
      IconData icon,
      double width,
      Color iconColor}) {
    return Container(
      width: width,
      height: 110,
      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.2),
              spreadRadius: 2,
              offset: Offset(0.5, 0.5),
              blurRadius: 2),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(color: textColor, fontSize: 14),
          ),
          SizedBox(
            height: 10,
          ),
          icon == null
              ? Text(
                  value,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      value,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      icon,
                      color: iconColor,
                    )
                  ],
                ),
        ],
      ),
    );
  }

  Container _backBgCover() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .25,
      decoration: BoxDecoration(
        gradient: greenGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
    );
  }
}
