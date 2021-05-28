import 'package:flutter/material.dart';
import 'package:technocrats/Dashboard/patient_search.dart';
import 'package:technocrats/constants.dart';
import 'package:technocrats/page/qr_scan_page.dart';
import './account_card.dart';
import './appointment_card.dart';
import './chart-painter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:technocrats/screens/chat/chat_screen_doctor.dart';
import './side_nav_doctor.dart';

Color primaryColor = Color(0xff0074ff);

class HospitalDashboardHome extends StatefulWidget {
  @override
  _HospitalDashboardHomeState createState() => _HospitalDashboardHomeState();
}

class _HospitalDashboardHomeState extends State<HospitalDashboardHome> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          DoctorDash(),
          PatientSearch(),
          QRScanPage(),
          //ChatScreen(),
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
            Icon(Icons.label, size: 20, color: Colors.black),
            Icon(Icons.map_sharp, size: 20, color: Colors.black),
            Icon(Icons.verified_user)
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

class DoctorDash extends StatelessWidget {
  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Flexible(
          flex: 2,
          child: Container(
            //color: Colors.blueGrey,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              //color: primaryColor,
              gradient: purpleGradient,
              //color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      //color: Color(0xff4d9eff),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Monthly Stats",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down_circle,
                          color: Colors.white,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Expanded(
                    child: CustomPaint(
                      foregroundPainter: ChartPainter(),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: _buildChartLegend(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: ListView(
                children: <Widget>[
                  Text(
                    "Appointments",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildCard(context, child: AppointmentCard()),
                  SizedBox(height: 20),
                  Text(
                    "Today (28 January)",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildCard(
                    context,
                    child: AccountCard(
                      name: 'Louisa Patel',
                      id: 'ID: AA741',
                      hour: '10:00 pm',
                      active: true,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildCard(
                    context,
                    child: AccountCard(
                      name: 'Sara Fuller',
                      id: 'ID: BA953',
                      hour: '11:00 pm',
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildCard(
                    context,
                    child: AccountCard(
                      name: 'Javier Fuller',
                      id: 'ID: DD5666',
                      hour: '01:00 pm',
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCard(context, {Widget child}) {
    return Card(
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Container(
        height: 90,
        width: MediaQuery.of(context).size.width,
        child: child,
      ),
    );
  }

  List<Widget> _buildChartLegend(BuildContext context) {
    List<Widget> legend = [];
    int monthIndex = 0;
    for (double i = 1; i < 16.0; i++) {
      if (i % 2 != 0) {
        legend.add(
          Positioned(
            left: (i * 23) - 10,
            top: 10,
            child: Container(
              height: 30,
              child: Text(
                getMonth(monthIndex++),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      }
    }

    return legend.toList();
  }

  String getMonth(int index) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug'];
    return months[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2A0B35),
        //title: Text('Side menu'),
      ),
      drawer: NavDrawer(),
      body: _buildBody(context),
    );
  }
}
