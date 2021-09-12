import 'package:flutter/material.dart';
import 'package:project_s/stageOne/login/MyAppLog.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MyAppLog(),
    );
  }
}
