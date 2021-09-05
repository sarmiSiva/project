import 'package:flutter/material.dart';
import 'package:project_s/constants.dart';
import 'package:project_s/main/indexApp.dart';
import 'package:project_s/stageOne/login/Login.dart';
import 'package:project_s/stageOne/login/SignUp.dart';
import 'package:project_s/stageOne/login/Start.dart';
import 'package:firebase_core/firebase_core.dart';

class MyAppLog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: kPrimaryColor),
      debugShowCheckedModeBanner: false,
      home: indexApp(),
      routes: <String, WidgetBuilder>{
        "Login": (BuildContext context) => Login(),
        "SignUp": (BuildContext context) => SignUp(),
        "start": (BuildContext context) => Start(),
      },
    );
  }
}
