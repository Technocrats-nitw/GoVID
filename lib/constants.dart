/*
Author :
Anshuman Mishra
Team : Technocrats
National Institute of Technology Warangal
*/

import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xFFF8F8F8);
const kActiveIconColor = Color(0xFFE68342);
const kTextColor = Color(0xFF222B45);
const kBlueLightColor = Color(0xFFC7B8F5);
const kBlueColor = Color(0xFF817DC0);
const kShadowColor = Color(0xFFE6E6E6);
final Color bgColor = Color(0xffF9F9F9);
final Color path1Color = Color(0xffE4E2FF);
const getStartedColorStart = Color(0xff54D579);
const getStartedColorEnd = Color(0xff00AABF);
final Color path2Color = Color(0xffcef4e8);
final Color docBgColor = Color(0xffE9B5FF);
final Color docContentBgColor = Color(0xffECF0F5);
final Color dateBgColor = Color(0xffD5E0FA);
final Color dateColor = Color(0xff3479C0);
const mainBgColor = Color(0xFFf2f2f2);
const darkColor = Color(0xFF2A0B35);
const midColor = Color(0xFF522349);
const lightColor = Color(0xFFA52C4D);
const darkRedColor = Color(0xFFFA695C);
const lightRedColor = Color(0xFFFD685A);

var kTitleStyle = TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color:Colors.black),);
var kSubtitleStyle = TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color:Colors.grey),);


const purpleGradient = LinearGradient(
  colors: <Color>[darkColor, midColor, lightColor],
  stops: [0.0, 0.5, 1.0],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const greenGradient = LinearGradient(
  colors: <Color>[getStartedColorStart, getStartedColorEnd],
  stops: [0.0, 1.0],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const redGradient = LinearGradient(
  colors: <Color>[darkRedColor, lightRedColor],
  stops: [0.0, 1.0],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const USER_IMAGE =
    'https://cdn4.iconfinder.com/data/icons/people-avatar-flat-1/64/girl_chubby_beautiful_people_woman_lady_avatar-512.png';
