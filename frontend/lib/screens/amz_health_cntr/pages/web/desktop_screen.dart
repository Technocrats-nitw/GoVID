/*
Author :
Anshuman Mishra
NIT Warangal
*/
import 'package:technocrats/screens/amz_health_cntr/pages/web/widgets/right_side_wdiget.dart';
import 'package:technocrats/screens/amz_health_cntr/pages/web/widgets/web_vertical_nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'widgets/body_content_widget.dart';

class DesktopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (_, sizingInformation) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Row(
                children: [
                  WebVerticalNavWidget(),
                  BodyContentWidget(
                    sizingInformation: sizingInformation,
                  ),
                ],
              ),
              Positioned(
                child: RightSideWidget(),
                bottom: 0.0,
                top: 0.0,
                right: 0.0,
              )
            ],
          ),
        );
      },
    );
  }
}
