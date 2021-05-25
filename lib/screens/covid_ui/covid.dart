import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:india_beats_covid/core/models/stats.dart';
import 'package:technocrats/constants.dart';
import 'package:technocrats/doctor_list.dart';
import 'package:technocrats/screens/covid_ui/treating_covid.dart';

//import 'package:india_beats_covid/utils/routes.dart';
import 'package:technocrats/utils/utils.dart';
import 'package:url_launcher/link.dart';

import '../../pkgs.dart';
import 'package:technocrats/widgets/action_card.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:technocrats/routes.dart';
import 'package:technocrats/screens/side_nav.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //@override
  //Widget build(BuildContext context) {
  // return Container();
  //}
//}

//class Dashboard extends StatefulWidget {
  //final Stats stats;

  //const Dashboard({Key key, @required this.stats}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(44, 24, 83, 255),
      appBar: AppBar(
        backgroundColor: Color(0xFF2A0B35),
        //title: Text('Side menu'),
      ),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        child: Column(
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
            /*[
            // if (!Vx.isWeb)
            Image.asset(
              "assets/images/covid/care.jpeg",
              height: 100.0,
            ),
            "Dashboard".text.bodyText2(context).xl4.extraBlack.make(),
          ].hStack(),*/
            40.heightBox,
            Wrap(
              runSpacing: 40.0,
              spacing: 40.0,
              alignment: WrapAlignment.start,
              children: [
                ActionCard(
                  title: "Plasma Donors",
                  subtitle: "xxx",
                  dense: "dd/mm/yyyy",
                  color: Colors.blue,
                  titleColor: Vx.blue300, //Vx.emerald700,
                  onTap: () {
                    //debugPrint("CARD main clicked. redirect to details page");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => doctorList()),
                    );
                  },
                ),
                ActionCard(
                  title: "Hospitals with Beds",
                  subtitle: "xxx", //stats?.hospitalBeds?.total?.toString(),
                  dense:
                      "dd/mm/yyyy", //Utils.getFormattedTime(stats?.hospitalBeds?.formattedTime),
                  color: Vx.pink300,
                  titleColor: Vx.pink700,
                  onTap: () {
                    //debugPrint("CARD main clicked. redirect to details page");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => doctorList()),
                    );
                  },
                ),
                ActionCard(
                  title: "Oxygen Suppliers",
                  subtitle: "xxx", //stats?.oxygenSuppliers?.total?.toString(),
                  dense: "dd/mm/yyyy",
                  //  Utils.getFormattedTime(stats?.oxygenSuppliers?.formattedTime),
                  color: Vx.yellow300,
                  titleColor: Vx.yellow700,
                  onTap: () {
                    //debugPrint("CARD main clicked. redirect to details page");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => doctorList()),
                    );
                  },
                ),
                ActionCard(
                  title: "Amazon Healthcare Center",
                  subtitle: "xxx", //stats?.medicines?.total?.toString(),
                  dense: "dd/mm/yyyy", //stats?.medicines?.formattedTime != "NA"
                  //    ? Utils.getFormattedTime(stats?.medicines?.formattedTime)
                  //    : stats?.medicines?.formattedTime,
                  color: Color(0xFFFD685A),
                  titleColor: Vx.blue700,
                  onTap: () {
                    //debugPrint("CARD main clicked. redirect to details page");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => doctorList()),
                    );
                  },
                ),
              ],
            ),
            20.heightBox,
            ActionCard(
              title: Constants.crowdFunding,
              subtitle2: Constants.fundRaising,
              iconOrImage: const Icon(
                FontAwesome.group,
                color: Vx.blue300,
              ).pOnly(left: 8),
              color: Color(0xFFFD685A),
              titleColor: Vx.blue700,
              onTap: () {
                //debugPrint("CARD main clicked. redirect to details page");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => doctorList()),
                );
              },
            ).wFull(context).pOnly(right: 30.0),
            20.heightBox,
            Link(
              target: LinkTarget.blank,
              uri: Uri.parse("https://selfregistration.cowin.gov.in/"),
              builder: (context, followLink) => ActionCard(
                title: Constants.registerForVaccine,
                subtitle2: Constants.vaccineSub,
                iconOrImage: const Icon(
                  MaterialCommunityIcons.medical_bag,
                  color: Vx.blue700,
                ).pOnly(left: 8),
                color: Color(0xFFFD685A),
                titleColor: Vx.pink400,
                onTap: followLink,
              ).wFull(context).pOnly(right: 30.0),
            ),
            20.heightBox,
            ActionCard(
              title: Constants.treatingCovid,
              subtitle2: Constants.careTips,
              iconOrImage: const Icon(
                AntDesign.Safety,
                color: Vx.purple300,
              ).pOnly(left: 8),
              color: Color(0xFFFD685A),
              titleColor: Vx.purple700,
              onTap: () {
                //debugPrint("CARD main clicked. redirect to details page");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TreatingCovidScreen()),
                );
              },
            ),
          ],
        ),
      ),
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
          /*Image.asset(
            "assets/images/covid/care.jpeg",
            height: 200.0,
          ),*/
          Text(
            'COVID 19 Emergency',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
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

  Container _backBgCover() {
    var size = MediaQuery.of(context).size; //this gonna g
    return Container(
      //height: 260.0,
      height: size.height * .25,
      decoration: BoxDecoration(
        gradient: greenGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
    );
  }
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
