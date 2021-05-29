import 'package:flutter/material.dart';
import 'package:technocrats/utils/constants.dart';
import 'package:technocrats/Dashboard/side_nav.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technocrats/widgets/card_section_hsp.dart';

class MedShop extends StatelessWidget {
  const MedShop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
      ),
      drawer: NavDrawer(),
      body: Container(
          height: MediaQuery.of(context).size.height,
          //   width: MediaQuery.of(context).size.width * 0.63,
          color: Colors.white,
          child: SingleChildScrollView(
              child: Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                Container(
                  margin: EdgeInsets.only(left: 30.0, top: 50.0, bottom: 10.0),
                  child: Text(
                    'MEDICAL SUPPLY STORE',
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Container(
                  height: 1000,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      CardSection(
                        image: AssetImage('assets/icons/syringe.png'),
                        title: "PPE suits",
                        value: "10",
                        unit: "piece",
                        time: "Delivery within 3 days",
                        color: Colors.red,
                        link:
                            'https://www.amazon.in/Antson-Protection-Non-Suffocating-Comfortable-Polyproplyene/dp/B08KGDHZK4/ref=pd_lpo_79_t_0/262-9127226-2838236?_encoding=UTF8&pd_rd_i=B08KGDHZK4&pd_rd_r=1bd62d1a-3c28-4181-9684-8ddc4b0852a9&pd_rd_w=TLvRT&pd_rd_wg=bX5oz&pf_rd_p=6b10875b-45e7-4b58-9b02-21bb75fd5289&pf_rd_r=F96XJ9VX2PEW0PWQ2ZE6&psc=1&refRID=F96XJ9VX2PEW0PWQ2ZE6&tag=',
                      ),
                      CardSection(
                        image: AssetImage('assets/icons/capsule.png'),
                        title: "Oxygen Concentrator",
                        value: "1",
                        unit: "machine",
                        time: "Delivery within 5 days",
                        color: Color(0xff6C6CE5),
                        link:
                            ('https://www.amazon.in/dp/B093FM8W9H/ref=sspa_dk_detail_0?psc=1&pd_rd_i=B093FM8W9H&pd_rd_w=AAsJC&pf_rd_p=f7411aaf-b7ff-4de1-8a53-cdd447bca5de&pd_rd_wg=TamFj&pf_rd_r=ZBE0J9891MQ0E4ZNG6WP&pd_rd_r=3fe1a417-e2e0-4ba0-aa52-b122d0a7d800&smid=A3AZ92EV52BHEV&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUExQU5ITzFZSlQ1NFRQJmVuY3J5cHRlZElkPUEwNzM5MjQxMkFHN0wyN1VER1IzRiZlbmNyeXB0ZWRBZElkPUEwOTgyODg0T0xHS1lMSjJTMURXJndpZGdldE5hbWU9c3BfZGV0YWlsJmFjdGlvbj1jbGlja1JlZGlyZWN0JmRvTm90TG9nQ2xpY2s9dHJ1ZQ=='),
                      ),
                      CardSection(
                        image: AssetImage('assets/icons/syringe.png'),
                        title: "X-Ray Machine",
                        value: "1",
                        unit: "machine",
                        time: "Delivery within 10 days",
                        color: Color(0xffFAAA1E),
                        link:
                            'https://www.amazon.com/Aries-Outlets-Portable-Machine-Digital/dp/B07ZF9RGZJ/ref=sr_1_2?dchild=1&keywords=x+ray+machine&qid=1621886690&sr=8-2&tag=',
                      ),
                      CardSection(
                        image: AssetImage('assets/icons/syringe.png'),
                        title: "Masks",
                        value: "50",
                        unit: "pack",
                        time: "Delivery within 3 days",
                        color: Colors.cyan,
                        link:
                            'https://www.amazon.in/dp/B08CL58JBC/ref=s9_acsd_obs_hd_bw_b9E2GhD_c2_x_0_t?pf_rd_m=A1K21FY43GMZF8&pf_rd_s=merchandised-search-11&pf_rd_r=XJWWVCWTXGXVT0RZKQVS&pf_rd_t=101&pf_rd_p=c1b32c99-e597-5fb6-8bc9-91d66323a4bc&pf_rd_i=8452605031&tag=',
                      ),
                    ],
                  ),
                ),
              ])))),
    );
  }
}
