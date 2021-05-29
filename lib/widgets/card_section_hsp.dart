/*
Coder : Ashiqa Rahman
Team : Technocrats
National Institute of Technology Warangal
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:technocrats/widgets/cart.dart';
import 'package:technocrats/widgets/custom_clipper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

import 'button_widget_qr.dart';

class CardSection extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final String time;
  final ImageProvider image;
  final String link;
  final Color color;

  CardSection(
      {Key key,
      @required this.title,
      @required this.value,
      @required this.unit,
      @required this.time,
      @required this.image,
      @required this.color,
      @required this.link})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            width: 270,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              shape: BoxShape.rectangle,
              color: Colors.white60,
              border: Border.all(
                color: color,
                width: 3,
              ),
            ),
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: <Widget>[
                Positioned(
                  child: ClipPath(
                    clipper: MyCustomClipper(clipType: ClipType.semiCircle),
                    child: Container(
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white.withOpacity(0.1),
                      ),
                      height: 120,
                      width: 120,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Image(
                              image: image,
                              width: 24,
                              height: 24,
                              color: color,
                            ),
                            Text(
                              time,
                              style: GoogleFonts.quicksand(
                                  fontSize: 13, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    title,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.quicksand(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: color),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '$value $unit',
                                    style: GoogleFonts.quicksand(
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                                  ),
                                  ButtonWidget(
                                    text: 'ADD to CART',
                                    color: color,
                                    onClicked: () => Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          CartView(),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            InkWell(
                                child: Container(
                                  decoration: new BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    shape: BoxShape.rectangle,
                                    color: Color(0xFFF0F4F8),
                                  ),
                                  width: 44,
                                  height: 44,
                                  child: Center(
                                    child: Icon(
                                      Icons.add_shopping_cart,
                                      color: color,
                                    ),
                                  ),
                                ),
                                onTap: () => launch(link)),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
