import 'dart:io';

import 'package:flutter/material.dart';
import 'package:technocrats/screens/pages/pages_hospital.dart';
import 'package:technocrats/screens/pages/pages_patient.dart';
import 'package:technocrats/screens/pages/pages_doctor.dart';
import 'package:technocrats/model/user.dart';
import 'package:technocrats/page/user_page.dart';
import 'package:technocrats/utils/user_preferences.dart';
import 'package:technocrats/widgets/title_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<User> users;

  @override
  void initState() {
    super.initState();

    users = UserPreferences.getUsers();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 96),
                child: Column(
                  children: <Widget>[
                    TitleWidget(icon: Icons.login, text: 'Login'),
                    const SizedBox(height: 48),
                    Expanded(child: buildUsers()),
                  ],
                ),
              ),
              Positioned(
                left: 16,
                top: 24,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(Icons.arrow_back, size: 32),
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildUsers() {
    if (users.isEmpty) {
      return Center(
        child: Text(
          'There are no users! Register !',
          style: TextStyle(fontSize: 24),
        ),
      );
    } else {
      return ListView.separated(
        itemCount: users.length,
        separatorBuilder: (context, index) => Container(height: 12),
        itemBuilder: (context, index) {
          final user = users[index];

          return buildUser(user);
        },
      );
    }
  }

  Widget buildUser(User user) {
    final imageFile = File(user.imagePath);

    return ListTile(
      tileColor: Colors.blue[100],
      onTap: () {
        if (user.role == 'doctor') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PagesDoc()),
          );
        } else if (user.role == 'patient') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PagesPatient()),
          );
        } else if (user.role == 'hospital') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PagesHospital()),
          );
        }
      },
      leading: user.imagePath.isEmpty
          ? null
          : CircleAvatar(backgroundImage: FileImage(imageFile)),
      title: Text(user.name, style: TextStyle(fontSize: 24)),
    );
  }
}
