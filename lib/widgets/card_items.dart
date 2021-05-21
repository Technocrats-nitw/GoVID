/*
Coder : Ashiqa Rahman
Team : Technocrats
National Institute of Technology Warangal
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:technocrats/constants.dart';
import 'package:technocrats/widgets/custom_clipper.dart';

class CardItems extends StatelessWidget {
  final Image image;
  final String title;
  final String date;
  final String type;
  final Color color;

  CardItems({
    Key? key,
    required this.image,
    required this.title,
    required this.date,
    required this.type,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: 120,
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: Stack(children: <Widget>[
        Positioned(
          child: ClipPath(
            clipper: MyCustomClipper(clipType: ClipType.halfCircle),
            child: Container(
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: color.withOpacity(0.1),
              ),
              height: 120,
              width: 100,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Icon and Hearbeat
              image,
              SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '$title',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Constants.textPrimary),
                          ),
                          Text(
                            '$date',
                            style: TextStyle(
                                fontSize: 15, color: Constants.textPrimary),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      child: Text(
                        '$type',
                        style: TextStyle(
                            fontSize: 15, color: Constants.textPrimary),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
