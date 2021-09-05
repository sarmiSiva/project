import 'package:flutter/material.dart';
import 'package:project_s/page/details/Features.dart';
import 'package:project_s/page/details/MainGridList.dart';

class details extends StatefulWidget {
  @override
  _detailsState createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[Features(), GridSubject(), MainGridList()],
    ));
  }
}
