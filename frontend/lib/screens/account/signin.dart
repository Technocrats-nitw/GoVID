import 'package:technocrats/helper/constants.dart';
import 'package:technocrats/helper/helperfunctions.dart';
import 'package:technocrats/services/auth.dart';
import 'package:technocrats/widgets/appbar.dart';
import 'package:flutter/material.dart';

import '../amz_health_cntr/amz_screen.dart';
import '../doctor_ui/dashboard.dart';
import '../hospital_ui/Dashboard.dart';
import '../patient_ui/bottom_navbar.dart';

class SignIn extends StatefulWidget {
  final Function toggle;

  SignIn(this.toggle);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  TextEditingController roleEditingController = new TextEditingController();

  AuthMethods authMethods = new AuthMethods();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  signIn() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      await authMethods
          .signInWithEmailAndPassword(
              emailEditingController.text, passwordEditingController.text)
          .then((result) async {
        if (result != null) {
          HelperFunctions.saveUserLoggedInSharedPreference(true);
          HelperFunctions.saveUserNameSharedPreference(
              passwordEditingController.text);
          HelperFunctions.saveUserEmailSharedPreference(
              emailEditingController.text);
          HelperFunctions.saveUserRoleSharedPreference(
              roleEditingController.text);
          Constants.myRole =
              await HelperFunctions.getUserRoleSharedPreference();
          print("signed in and role is ${Constants.myRole}  ");
          if (Constants.myRole == "hospital") {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => DashBoard()));
          }
          if (Constants.myRole == "patient") {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => PagesPatient()));
          }
          if (Constants.myRole == "doctor") {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => HospitalDashboardHome()));
          }
          if (Constants.myRole == "amazon") {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => amzHealthScreen()));
          }
        } else {
          setState(() {
            isLoading = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: roleEditingController,
                          decoration: InputDecoration(
                            hintText: "Role",
                            hintStyle: TextStyle(
                              color: Colors.black38,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo[900]),
                            ),
                          ),
                        ),
                        TextFormField(
                          validator: (val) {
                            return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(val)
                                ? null
                                : "Please Enter Correct Email";
                          },
                          controller: emailEditingController,
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: Colors.black38,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo[900]),
                            ),
                          ),
                        ),
                        TextFormField(
                          obscureText: true,
                          validator: (val) {
                            return val.length > 5
                                ? null
                                : "Enter Password 6 characters";
                          },
                          controller: passwordEditingController,
                          decoration: InputDecoration(
                            hintText: "password",
                            hintStyle: TextStyle(
                              color: Colors.black38,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo[900]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: Text("Forgot Password? "),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      signIn();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.indigo[700],
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      widget.toggle();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.indigo[700],
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 250,
                  ),
                ],
              ),
            ),
    );
  }
}
