/*
Author : Ashiqa Rahman (App Development Enthusiast)
Team :technocrats 
National Institute of Technology , Warangal */

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:technocrats/screens/pages/pages_patient.dart';
import 'package:technocrats/screens/pages/pages_doctor.dart';
import 'package:technocrats/screens/pages/pages_hospital.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email, _password;

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PagesPatient()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  login() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);
      } catch (e) {
        showError(e.message);
      }
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(children: <Widget>[
      Container(
        height: 400,
        child: Image(
          image: AssetImage("images/login.jpg"),
          fit: BoxFit.contain,
        ),
      ),
      Container(
          child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
                Container(
                  child: TextFormField(
                      validator: (input) {
                        if (input.isEmpty) return 'Enter email';
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Email', prefixIcon: Icon(Icons.email)),
                      onSaved: (input) => _email = input),
                ),
                Container(
                  child: TextFormField(
                      validator: (input) {
                        if (input.length < 6)
                          return 'Provide minimum 6 letters';
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                      onSaved: (input) => _password = input),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                    primary: Colors.indigo[900],
                  ),
                  onPressed: login,
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )
              ]))),
    ])));
  }
}
