/*
Author :
Anshuman Mishra
Team :technocrats
National Institute of Technology Warangal
*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:technocrats/utils/constants.dart';

class CategoryCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  final Function press;
  const CategoryCard({
    this.svgSrc = "assets/icons/Meditation.svg",
    this.title = "title",
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: kShadowColor,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  SvgPicture.asset(svgSrc),
                  Spacer(),
                  Text(title,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 24.0)
                      /*Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 15),
                        */

                      )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
