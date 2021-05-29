import 'dart:io';

import 'package:flutter/material.dart';
import 'package:technocrats/screens/hospital_ui/Dashboard.dart';
import 'package:technocrats/screens/patient_ui/bottom_navbar.dart';
import 'package:technocrats/model/user.dart';
import 'package:technocrats/utils/user_preferences.dart';
import 'package:technocrats/screens/amz_health_cntr/amz_screen.dart';
import 'package:technocrats/widgets/title_widget.dart';
import 'package:technocrats/screens/doctor_ui/dashboard.dart';

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
            MaterialPageRoute(builder: (context) => HospitalDashboardHome()),
          );
        } else if (user.role == 'patient') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PagesPatient()),
          );
        } else if (user.role == 'hospital') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DashBoard()),
          );
        } else if (user.role == 'amazon') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => amzHealthScreen()),
          );
        }
      },
      leading: user.imagePath.isEmpty
          ? null
          : CircleAvatar(backgroundImage: FileImage(imageFile)),
      title: Text(user.name, style: TextStyle(fontSize: 24)),
      subtitle: Text(user.role, style: TextStyle(fontSize: 24)),
    );
  }
}
