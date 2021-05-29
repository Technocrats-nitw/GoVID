import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class RightSideWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      width: 400,
      height: 900,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            blurRadius: 2,
            offset: Offset(0.5, 0.0),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Wrap(
        children: [
          _searchWidget(),
          _profileWidget(),
          _reminderWidget(),
        ],
      ),
    );
  }

  Widget _searchWidget() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 220,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            child: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileWidget() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 190,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello,",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Anshuman!",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Manager",
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              ),
              Container(
                width: 80,
                height: 80,
                child: Image.asset("assets/images/dev/Anshuman Mishra.jpeg"),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 190,
                height: 35,
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search Equipment/Stock ...",
                    hintStyle: TextStyle(fontSize: 16),
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.copy,
                      size: 18,
                    ),
                  ),
                ),
              ),
              Container(
                height: 35,
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _reminderWidget() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Reminders",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Text(
                    "View All",
                    style: TextStyle(color: Colors.orange),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.orange,
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          _singleRowButton(
              title: "New Message",
              description: "Amazon GoVID HealthCare Center, Warangal",
              icon: Icons.announcement_outlined,
              iconColor: Colors.yellow[600],
              boxColor: Colors.yellow[100]),
          SizedBox(
            height: 15,
          ),
          _singleRowButton(
              title: "New Message",
              description: "Amazon GoVID HealthCare Center, Warangal",
              icon: Icons.announcement_outlined,
              iconColor: Colors.yellow[600],
              boxColor: Colors.yellow[100]),
          SizedBox(
            height: 15,
          ),
          _singleRowButton(
              title: "New Message",
              description: "Amazon GoVID HealthCare Center, Warangal",
              icon: Icons.announcement_outlined,
              iconColor: Colors.yellow[600],
              boxColor: Colors.yellow[100]),
          SizedBox(
            height: 15,
          ),
          _singleRowButton(
              title: "New Message",
              description: "Amazon GoVID HealthCare Center, Warangal",
              icon: Icons.announcement_outlined,
              iconColor: Colors.yellow[600],
              boxColor: Colors.yellow[100]),
          SizedBox(
            height: 15,
          ),
          _singleRowButton(
              title: "New Message",
              description: "Amazon GoVID HealthCare Center, Warangal",
              icon: Icons.announcement_outlined,
              iconColor: Colors.yellow[600],
              boxColor: Colors.yellow[100]),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  _singleRowButton(
      {Color boxColor,
      Color iconColor,
      IconData icon,
      String title,
      String description}) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: boxColor,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Icon(
            icon,
            size: 20,
            color: iconColor,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              description,
              style: TextStyle(fontSize: 14, color: Colors.grey[400]),
            )
          ],
        )
      ],
    );
  }
}
