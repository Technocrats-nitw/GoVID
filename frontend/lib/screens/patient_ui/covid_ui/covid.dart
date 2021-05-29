import 'package:flutter_icons/flutter_icons.dart';
import 'package:technocrats/utils/constants.dart';
import 'package:technocrats/screens/patient_ui/nearby_hosp_doc/doctors.dart';
import 'package:technocrats/screens/patient_ui/covid_ui/treating_covid.dart';

import 'package:url_launcher/link.dart';

import '../../../utils/pkgs.dart';
import 'package:technocrats/widgets/action_card.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:technocrats/screens/side_nav.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
//}

//class Dashboard extends StatefulWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(44, 24, 83, 255),
      appBar: AppBar(
        backgroundColor: Color(0xFF2A0B35),
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
                  subtitle: "726",
                  dense: "25/05/2021",
                  color: Colors.blue,
                  titleColor: Vx.blue300,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => doctorList()),
                    );
                  },
                ),
                ActionCard(
                  title: "Hospitals with Beds",
                  subtitle: "3256",
                  dense: "25/05/2021",
                  color: Vx.pink300,
                  titleColor: Vx.pink700,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => doctorList()),
                    );
                  },
                ),
                ActionCard(
                  title: "Oxygen Suppliers",
                  subtitle: "1751",
                  dense: "25/05/2021",
                  color: Vx.yellow300,
                  titleColor: Vx.yellow700,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => doctorList()),
                    );
                  },
                ),
                ActionCard(
                  title: "Amazon Healthcare Center",
                  subtitle: "5",
                  dense: "25/05/2021",
                  color: Color(0xFFFD685A),
                  titleColor: Vx.blue700,
                  onTap: () {
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
            'COVID19 Emergency',
            style: TextStyle(
              fontSize: 30,
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
    var size = MediaQuery.of(context).size;
    return Container(
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
}
