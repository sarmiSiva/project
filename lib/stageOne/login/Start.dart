import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:project_s/constants.dart';
//import 'package:authentification/Login.dart';

import 'SignUp.dart';

import 'package:google_sign_in/google_sign_in.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> googleSignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      if (googleAuth.idToken != null && googleAuth.accessToken != null) {
        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        final UserCredential user =
            await _auth.signInWithCredential(credential);

        await Navigator.pushReplacementNamed(context, "/");

        return user;
      } else {
        throw StateError('Missing Google Auth Token');
      }
    } else
      throw StateError('Sign in Aborted');
  }

  navigateToLogin() async {
    Navigator.pushReplacementNamed(context, "Login");
  }

  navigateToRegister() async {
    Navigator.pushReplacementNamed(context, "SignUp");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 100.0),
            Container(
              height: 300,
              child: Image(
                image: AssetImage("assets/img.png"),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20),
            RichText(
                text: TextSpan(
                    text: 'Welcome to ',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: <TextSpan>[
                  TextSpan(
                      text: 'E Bin',
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent))
                ])),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'A Stepping To Keep Environment Clean.',
                style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontSize: 20.0),
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  onPressed: navigateToLogin,
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: kPrimaryColor,
                ),
                SizedBox(width: 20.0),
                RaisedButton(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  onPressed: navigateToRegister,
                  child: Text(
                    'REGISTER',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.blueGrey,
                ),
              ],
            ),
            SizedBox(height: 20.0),
            SignInButton(Buttons.Google,
                text: "Sign up with Google", onPressed: googleSignIn),
            SizedBox(height: 30.0),
            Text(
              "DesignBy Sarmila.S - 2022840",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
