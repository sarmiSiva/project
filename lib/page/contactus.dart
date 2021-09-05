import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
/*
void main() {
  runApp(new MaterialApp(
    home: new contactus(),
  ));
}
*/

class contactus extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<contactus> {
  void _showUrl() {
    _launch('http://www.voidrealms.com');
  }

  void _showEmail() {
    _launch('mailto:2sourcefort@gmail.com');
  }

  void _showTelephone() {
    _launch('tel:021-111-1111');
  }

  void _showSms() {
    _launch('sms:021-111-1111');
  }

  Future<void> _launch(String urlString) async {
    if (await canLaunch(urlString)) {
      await launch(urlString);
    } else {
      throw 'Could not launch Url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Contact Us'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new RaisedButton(
                onPressed: _showUrl,
                child: new Text('URL'),
              ),
              new RaisedButton(
                onPressed: _showEmail,
                child: new Text('Email'),
              ),
              new RaisedButton(
                onPressed: _showSms,
                child: new Text('Sms'),
              ),
              new RaisedButton(
                onPressed: _showTelephone,
                child: new Text('Telephone'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
