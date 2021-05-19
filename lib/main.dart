/*
Author :
Anshuman Mishra
Team : Technocrats
National Institute of Technology Warangal
*/

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:technocrats/constants.dart';
import 'package:technocrats/widgets/category_card.dart';
import 'package:technocrats/widgets/search_bar.dart';
import 'package:technocrats/screens/tabscreen1.dart';
import 'package:technocrats/screens/tabscreen2.dart';
import 'package:technocrats/screens/doctor_ui/doctors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hackon With Amazon',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: Color.fromRGBO(44, 24, 83, 255),
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: Pages(),
    );
  }
}

class Pages extends StatefulWidget {
  //const Pages({Key key}) : super(key: key);

  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device

    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          TabScreen1(),
          TabScreen2(),
          doctorUi(),
          TabScreen2(),
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
            Icon(Icons.medical_services_outlined,
                size: 20, color: Colors.black),
            Icon(Icons.maps_home_work_outlined, size: 20, color: Colors.black),
            Icon(Icons.medical_services_outlined,
                size: 20, color: Colors.black),
            Icon(Icons.account_circle_outlined, size: 20, color: Colors.black),
          ],
          animationDuration: Duration(milliseconds: 400),
          backgroundColor: Color.fromRGBO(44, 24, 83, 255),
          buttonBackgroundColor: Color.fromRGBO(44, 24, 83, 255),
          index: 1,
          onTap: (index) {
            setState(() {
              _pageController.jumpToPage(index);
            });
          }),
    );
  }
}

/*
class HomeScreen extends StatefulWidget {

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device

    return Scaffold(
      //bottomNavigationBar: BottomNavBar(),
      /*body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/menu.svg"),
                    ),
                  ),
                  Text(
                    "CoVID-19 Emergency",
                    style:TextStyle(color: Colors.black,fontSize: 24.0),
                    /*Theme.of(context)
                        .textTheme
                        .display1
                        .copyWith(fontWeight: FontWeight.w900),
                        */

                  ),
                  SearchBar(),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "Beds Availabile Nearby",
                          svgSrc: "assets/icons/Hamburger.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Oxygen Cyliders Availibility",
                          svgSrc: "assets/icons/Excrecises.svg",
                          press: () {},
                        ),
                        CategoryCard(
                            title: "Plasma Availability",
                            svgSrc: "assets/icons/yoga.svg",
                            press: () {},
                        ),
                        CategoryCard(
                          title: "Vaccination",
                          svgSrc: "assets/icons/yoga.svg",
                          press: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),*/
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          TabScreen1(),
          TabScreen2(),
          TabScreen1(),
        ],
        onPageChanged: (int index) {
          setState(() {
            _pageController.jumpToPage(index);
          });
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
          items:<Widget>[
            Icon(Icons.verified_user,size:20,color:Colors.black),
            Icon(Icons.verified_user,size:20,color:Colors.black),
            Icon(Icons.verified_user,size:20,color:Colors.black),
          ],
        animationDuration: Duration(milliseconds: 200),
        backgroundColor: Colors.indigo,
        index:1,
        onTap:(index){
            setState((){
              _pageController.jumpToPage(index);
            });
        }
      ),
    );
  }

  Widget tab1() {
    return MaterialApp(
      home: TabScreen1(),
    );
  }



}
*/
