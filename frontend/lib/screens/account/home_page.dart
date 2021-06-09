import 'package:flutter/material.dart';
import 'package:technocrats/widgets/button_widget.dart';
import 'package:technocrats/widgets/title_widget.dart';
import 'package:technocrats/helper/authenticate.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 96),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleWidget(icon: Icons.home, text: 'Amazon Care'),
                buildButtons(),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildButtons() => Container(
        alignment: Alignment.center,
        child: ButtonWidget(
          text: 'Get Started',
          onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Authenticate(),
          )),
        ),
      );
}
