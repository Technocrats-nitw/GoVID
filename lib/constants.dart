/*
Author :
Anshuman Mishra & Ashiqa Rahman
Team :technocrats
National Institute of Technology Warangal
*/

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

mixin AppColors {
  static Color primaryColor = Colors.purple;
  static Color accentColor = Colors.pink;
}

mixin Utils {
  static bool get checkIfDebug {
    var debug = false;
    assert(debug = true);
    return debug;
  }

  static String getFormattedTime(String iso) {
    if (iso != null) {
      final DateTime now = DateTime.parse(iso).toLocal();
      final DateFormat formatter = DateFormat('dd-MM-yyyy hh:mm aa');
      return "${formatter.format(now)} (~${now.toLocal().timeAgo()})";
    }
    return null;
  }

  // static String getTimeAgo(String iso, {bool enableShort = true}) {
  //   if (iso != null) {
  //     final DateTime now = DateTime.parse(iso);

  //     return now.timeAgo(enableFromNow: enableShort);
  //   }
  //   return null;
  // }
}

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

var kTitleStyle =
    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black);
var kSubtitleStyle =
    TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.grey);

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

class Constants {
  // App Related
  static String appName = "India Beats Covid";
  static double appVersion = 1.0;
  static String baseUrl = "https://indiabeatscovid.in/";
  static String policyUrl = "https://indiabeatscovid.in/policies";
  static String devUrl = "https://twitter.com/imthepk";
  static String githubUrl = "https://github.com/iampawan/IndiaBeatsCovid";
  static String mailID = "indiabeatscovid@gmail.com";

  //Assets
  static String imageAsset = "assets/images/";

  // Generic Texts
  static String weAreWithYou = "We are with you";
  static String effortsText =
      "This is an effort to bring together and verify all the contacts of the needed resources for people fighting COVID-19 in our country India.";

  static String smallTeam =
      "We have a small team of volunteers who are regularly verifying all the contacts submitted.";

  static String lastUpdated = "Last updated";
  static String total = "Total";

  // Utils

  static String noInternet = "Looks like you are not connected to the internet";
  static String wentWrong = "Something went wrong";
  static String noData = "No data found";

  // * Home Texts
  static String plasmaDonors = "Plasma Donors";
  static String hospitalWithBeds = "Hospital With Beds";
  static String oxygenSuppliers = "Oxygen Suppliers";
  static String medicineSuppliers = "COVID Medicine Suppliers";
  static String externalLinks = "External Links";
  static String twitterSearch = "Twitter Search for COVID";
  static String crowdFunding = "Crowdfunding";
  static String fundRaising = "Fundraising to fight with COVID";
  static String twitterResources =
      "Find latest resources in real time on Twitter";
  static String selectRegion = "Select/Type Region";
  static String findOnTwitter = "Find On Twitter";
  static String registerForVaccine = "Register for Vaccination";
  static String vaccineSub = "Registration open for Age 18+";
  static String treatingCovid = "Treating Covid-19 at Home";
  static String careTips = "Care tips for you and others";

// Material Design Color
  static Color lightPrimary = Color(0xfffcfcff);
  static Color lightAccent = Color(0xFF3B72FF);
  static Color lightBackground = Color(0xfffcfcff);

  static Color darkPrimary = Colors.black;
  static Color darkAccent = Color(0xFF3B72FF);
  static Color darkBackground = Colors.black;

  static Color grey = Color(0xff707070);
  static Color textPrimary = Color(0xFF486581);
  static Color textDark = Color(0xFF102A43);

  static Color backgroundColor = Color(0xFFF5F5F7);
// Yellow
  static Color darkYellow = Color(0xFF3ABD6F);
  static Color lightYellow = Color(0xFFFFDA7A);

  // Blue
  static Color darkBlue = Color(0xFF3B72FF);
  static Color lightBlue = Color(0xFF3EC6FF);

  // Orange
  static Color darkOrange = Color(0xFFFFB74D);
//Purple
  static Color lightPurple = Color(0xFFCC99FF);
  static Color darkPurple = Color(0xFF30357E);
//Pink
  static Color lightPink = Color(0xFFFDC2F4);
  static Color darkPink = Color(0xFFF90052);
  static ThemeData lighTheme(BuildContext context) {
    return ThemeData(
      backgroundColor: lightBackground,
      primaryColor: lightPrimary,
      accentColor: lightAccent,
      cursorColor: lightAccent,
      scaffoldBackgroundColor: lightBackground,
      textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      appBarTheme: AppBarTheme(
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
        iconTheme: IconThemeData(
          color: lightAccent,
        ),
      ),
    );
  }

  static double headerHeight = 228.5;
  static double paddingSide = 30.0;
}

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primaryColor,
      accentColor: AppColors.accentColor,
      // cardColor: Colors.white,
      // scaffoldBackgroundColor: Colors.white,
      fontFamily: GoogleFonts.muli().fontFamily,
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        backgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme,
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.teal,
      primaryColor: AppColors.primaryColor,
      accentColor: AppColors.accentColor,
      // cardColor: Colors.black26,
      fontFamily: GoogleFonts.muli().fontFamily,
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: Colors.black26,
        textTheme: Theme.of(context).primaryTextTheme,
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
    );
  }
}

class Strings {
  static String doctors_url =
      'http://technocrats.pythonanywhere.com/api/doctor/';
  static String hospital_url =
      "https://technocrats.pythonanywhere.com/api/hospital";
}
