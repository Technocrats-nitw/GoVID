import 'package:flutter/material.dart';
import 'package:technocrats/page/login_page.dart';
import 'package:technocrats/page/user_page.dart';
import 'package:technocrats/widgets/button_widget.dart';
import 'package:technocrats/widgets/title_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 96),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleWidget(icon: Icons.home, text: 'Amazon Care'),
                buildButtons(),
              ],
            ),
          ),
        ),
      );

  Widget buildButtons() => Column(
        children: [
          const SizedBox(height: 24),
          ButtonWidget(
            text: 'Login',
            onClicked: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => LoginPage(),
            )),
          ),
          const SizedBox(height: 24),
          ButtonWidget(
            text: 'Register',
            onClicked: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => UserPage(),
            )),
          ),
        ],
      );
}
