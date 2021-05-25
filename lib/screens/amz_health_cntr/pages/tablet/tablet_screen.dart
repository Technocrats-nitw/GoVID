import 'package:technocrats/screens/amz_health_cntr/pages/tablet/widgets/body_content_tablet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'widgets/tablet_vertical_nav_widget.dart';

class TabletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (_, sizingInformation) {
        return Scaffold(
          body: Container(
            child: Row(
              children: [
                TabletVerticalNavWidget(),
                Expanded(
                  child: SingleChildScrollView(
                    child: BodyContentTabletWidget(
                      sizingInformation: sizingInformation,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
