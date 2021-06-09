import 'package:technocrats/helper/constants.dart';
import 'package:technocrats/helper/helperfunctions.dart';
import 'package:technocrats/services/auth.dart';
import 'package:technocrats/services/database.dart';
import 'package:flutter/material.dart';
import 'package:technocrats/widgets/appbar.dart';

class SignUp extends StatefulWidget {
  final Function toggle;

  SignUp(this.toggle);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;

  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  TextEditingController usernameEditingController = new TextEditingController();
  TextEditingController roleEditingController = new TextEditingController();

  signMeUp() {
    if (formKey.currentState.validate()) {
      Map<String, dynamic> userInfoMap = {
        "name": usernameEditingController.text,
        "email": emailEditingController.text,
        "role": roleEditingController.text,
      };
      setState(() {
        isLoading = true;
      });
      authMethods
          .signUpWithEmailAndPassword(
              emailEditingController.text, passwordEditingController.text)
          .then((val) {
        print('hello signed up');

        databaseMethods.uploadUserInfo(userInfoMap);

        HelperFunctions.saveUserLoggedInSharedPreference(true);
        HelperFunctions.saveUserNameSharedPreference(
            usernameEditingController.text);
        HelperFunctions.saveUserEmailSharedPreference(
            emailEditingController.text);
        HelperFunctions.saveUserRoleSharedPreference(
            roleEditingController.text);
        Constants.myRole =
            HelperFunctions.getUserRoleSharedPreference().toString();
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => ChatRoom()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
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
                            validator: (val) {
                              return val.isEmpty || val.length < 6
                                  ? "Enter 6 chars"
                                  : null;
                            },
                            controller: usernameEditingController,
                            decoration: InputDecoration(
                              hintText: "Name",
                              hintStyle: TextStyle(
                                color: Colors.black38,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.indigo[900]),
                              ),
                            ),
                          ),
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
                                borderSide:
                                    BorderSide(color: Colors.indigo[900]),
                              ),
                            ),
                          ),
                          TextFormField(
                            validator: (val) {
                              return RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(val)
                                  ? null
                                  : "Enter correct email";
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
                                borderSide:
                                    BorderSide(color: Colors.indigo[900]),
                              ),
                            ),
                          ),
                          TextFormField(
                            obscureText: true,
                            validator: (val) {
                              return val.length < 6
                                  ? "Enter Password 6 chars"
                                  : null;
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
                                borderSide:
                                    BorderSide(color: Colors.indigo[900]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        signMeUp();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.indigo[700]),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Save",
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
            ),
    );
  }
}
