import 'package:technocrats/screens/amz_health_cntr/fake_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:technocrats/constants.dart';

class BodyContentWidget extends StatefulWidget {
  final SizingInformation sizingInformation;

  const BodyContentWidget({Key key, this.sizingInformation}) : super(key: key);

  @override
  _BodyContentWidgetState createState() => _BodyContentWidgetState();
}

class _BodyContentWidgetState extends State<BodyContentWidget> {
  int _rowCurrentBtnIndex = 0;
  final _data = FakeRepository.data;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: widget.sizingInformation.screenSize.width / 1.4,
      child: Column(
        children: [
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .15,
            decoration: BoxDecoration(
              gradient: purpleGradient,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),
          _headerWidget(),
          _quickStatsWidget(),
          _rowButtons(),
          SizedBox(
            height: 5,
          ),
          _gridListItems(),
        ],
      ),
    );
  }

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
            'Amazon GoVID HealthCare \nCenter',
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

  Widget _headerWidget() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Amazon GoVID HealthCare Center",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Hyderabad",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Text(
              "Customise Blocks",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _quickStatsWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Quick Stats",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          widget.sizingInformation.screenSize.width / 1.4 <= 860
              ? _row2by2Widget()
              : _row4Widget()
        ],
      ),
    );
  }

  Widget _row4Widget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _singleItemQuickStats(
          title: "Total Vaccine Stock",
          value: "2834",
          icon: Icons.medical_services,
        ),
        _singleItemQuickStats(
            title: "Pending orders",
            value: "180",
            icon: Icons.access_alarms_outlined,
            textColor: Colors.red),
        _singleItemQuickStats(
            title: "Scheduled Shipments (Today)",
            value: "109",
            icon: Icons.timelapse_sharp,
            iconColor: Colors.green),
        _singleItemQuickStats(
            title: "Staff Details",
            value: " x ",
            icon: Icons.people,
            iconColor: Colors.blueGrey),
      ],
    );
  }

  Widget _row2by2Widget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _singleItemQuickStats(
                title: "Scheduled Shipments (Today)",
                value: "109",
                width: widget.sizingInformation.screenSize.width / 3.1,
                icon: null,
                textColor: Colors.greenAccent),
            _singleItemQuickStats(
                title: "Pending Orders",
                value: "180",
                icon: null,
                width: widget.sizingInformation.screenSize.width / 3.1,
                textColor: Colors.red),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _singleItemQuickStats(
                title: "Orders Recieved Today",
                value: "810",
                icon: Icons.arrow_upward,
                iconColor: Colors.green,
                width: widget.sizingInformation.screenSize.width / 3.1),
            _singleItemQuickStats(
                title: "Monthly Return",
                value: "20%",
                icon: Icons.arrow_upward,
                width: widget.sizingInformation.screenSize.width / 3.1,
                iconColor: Colors.red),
          ],
        ),
      ],
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
            style: TextStyle(color: textColor, fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          icon == null
              ? Text(
                  value,
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      value,
                      style: TextStyle(
                        fontSize: 28,
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

  Widget _rowButtons() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(top: 15, right: 20, left: 20),
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 1, color: Colors.black.withOpacity(.2)))),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _rowCurrentBtnIndex = 0;
              });
            },
            child: _singleRowButton(
              title: "Current Medical Stock",
              textColor: _rowCurrentBtnIndex == 0 ? Colors.red : Colors.black,
              borderColor: _rowCurrentBtnIndex == 0
                  ? Colors.deepOrange
                  : Colors.transparent,
            ),
          ),
          SizedBox(
            width: 50,
          ),
          InkWell(
            onTap: () {
              setState(() {
                _rowCurrentBtnIndex = 1;
              });
            },
            child: _singleRowButton(
              title: "Inbox",
              textColor: _rowCurrentBtnIndex == 1 ? Colors.red : Colors.black,
              borderColor: _rowCurrentBtnIndex == 1
                  ? Colors.deepOrange
                  : Colors.transparent,
            ),
          ),
          SizedBox(
            width: 50,
          ),
          InkWell(
            onTap: () {
              setState(() {
                _rowCurrentBtnIndex = 2;
              });
            },
            child: _singleRowButton(
              title: "Order Under Process",
              textColor: _rowCurrentBtnIndex == 2 ? Colors.red : Colors.black,
              borderColor: _rowCurrentBtnIndex == 2
                  ? Colors.deepOrange
                  : Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }

  Widget _singleRowButton({
    String title,
    Color textColor,
    Color borderColor,
  }) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 2, color: borderColor))),
      child: Text(
        title,
        style: TextStyle(color: textColor, fontSize: 20),
      ),
    );
  }

  Widget _gridListItems() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          //physics: const NeverScrollableScrollPhysics(),
          itemCount: _data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  widget.sizingInformation.screenSize.width / 1.4 <= 860
                      ? 2
                      : 3,
              childAspectRatio: 1.7),
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
                            fontSize: 18,
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
                          Text("Stock Last Arrived",
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 14)),
                          Text(
                            _data[index].date,
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Time",
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 14)),
                          Text(
                            _data[index].time,
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order Stock",
                        style: TextStyle(fontSize: 18, color: Colors.indigo),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
