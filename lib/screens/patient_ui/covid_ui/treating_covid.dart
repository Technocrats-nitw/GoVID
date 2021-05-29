import 'package:flutter_svg/svg.dart';
import 'package:technocrats/utils/constants.dart';

import '../../../utils/pkgs.dart';

class TreatingCovidScreen extends StatefulWidget {
  @override
  _TreatingCovidScreenState createState() => _TreatingCovidScreenState();
}

class _TreatingCovidScreenState extends State<TreatingCovidScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Constants.treatingCovid.text.make(),
        backgroundColor: Color(0xFF2A0B35),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            overflow: Overflow.visible,
            children: <Widget>[
              _backBgCover(),
              _greetings(),
            ],
          ),
          /*
          '''Most people who become sick with COVID-19 will only experience mild illness and can recover at home. Symptoms might last a few days, and people who have the virus might feel better in about a week. Treatment is aimed at relieving symptoms and includes rest, fluid intake and pain relievers.'''
              .text
              .xl
              .make(),*/
          20.heightBox,
          "Protecting yourself while caring for someone with COVID-19"
              .text
              .xl2
              .bold
              .make(),
          10.heightBox,
          [
            // if (!Vx.isWeb)
            SvgPicture.asset(
              "assets/images/covid/doctor-woman.svg",
              height: 300.0,
            ).w32(context).centered(),
            VxDiscList(
              [
                "Keep your hands clean and away from your face",
                "Wear a face mask",
                "Clean your home frequently",
                "Be careful with laundry",
                "Be careful with dishes",
                "Avoid direct contact with the sick person's bodily fluids",
                "Avoid having unnecessary visitors in your home"
              ],
              color: context.textTheme.bodyText1.color,
            ).w56(context),
          ].hStack(crossAlignment: CrossAxisAlignment.start),
          20.heightBox,
          "Emergency warning signs".text.xl2.bold.make(),
          10.heightBox,
          [
            VxDiscList(
              [
                "Trouble breathing",
                "Persistent chest pain or pressure",
                "New confusion",
                "Inability to stay awake",
                "Pale, gray or blue-colored skin, lips or nail beds — depending on skin tone"
              ],
              color: context.textTheme.bodyText1.color,
            ).w56(context),
            // if (!Vx.isWeb)
            SvgPicture.asset(
              "assets/images/covid/mask-woman.svg",
              height: 200.0,
            ).w32(context).centered(),
          ].hStack(crossAlignment: CrossAxisAlignment.start),
          20.heightBox,
          "At-Home Coronavirus Treatment".text.xl2.bold.make(),
          VxDiscList(
            [
              "Rest. It can make you feel better and may speed your recovery.",
              "Sleep in the Prone Position",
              "Stay home. Don't go to work, school, or public places.",
              "Drink fluids. You lose more water when you're sick. Dehydration can make symptoms worse and cause other health problems",
              "Monitor. If your symptoms get worse, call your doctor right away. Don't go to their office without calling first. They might tell you to stay home, or they may need to take extra steps to protect staff and other patients.",
              "Ask your doctor about over-the-counter medicines that may help, like acetaminophen to lower your fever.",
            ],
            color: context.textTheme.bodyText1.color,
          ),
          20.heightBox,
          "Monitoring Tips".text.xl2.bold.make(),
          VxDiscList(
            [
              "Keep the fans on and windows open",
              "Have a thermometer and pulse oximeter to monitor regularly",
              "Remember to wipe them between use",
              "Measure Pulse, O2 Saturation and Temperature every 6 hours",
              "Immediately consult your doctor if saturation goes below 90-92",
            ],
            color: context.textTheme.bodyText1.color,
          ),
          20.heightBox,
          "Some simple useful medicines for everyone (Consult doctor if required or in emergency)"
              .text
              .xl2
              .bold
              .make(),
          [
            VxDiscList(
              [
                "Paracetamol for fever",
                "Budesonide for Inhalation",
                "Karvol Plus for steam",
                "Azithromycin",
                "Doxycycline",
                "Vitamin C & Zinc"
              ],
              color: context.textTheme.bodyText1.color,
            ).w56(context),
            // if (!Vx.isWeb)
            SvgPicture.asset(
              "assets/images/doctor-man.svg",
              height: 200.0,
            ).w32(context).centered(),
          ].hStack(),
        ],
      ).p16().scrollVertical(),
    );
  }

  Positioned _greetings() {
    return Positioned(
      left: 30,
      bottom: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/images/onBoardDoc.png",
            height: 200.0,
          ),
        ],
      ),
    );
  }

  Container _backBgCover() {
    var size = MediaQuery.of(context).size; //this gonna g
    return Container(
      //height: 260.0,
      height: size.height * .45,
      decoration: BoxDecoration(
        gradient: purpleGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
    );
  }
}
