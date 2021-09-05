import 'package:flutter/material.dart';

class widget extends StatelessWidget {
  //const widget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _itemname;
    String _name;
    String _email;
    String _password;
    String _url;
    String _phoneNumber;
    String _calories;

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    Widget _additem() {
      return TextFormField(
        decoration:
            InputDecoration(labelText: 'Name', hintText: 'Enter you Name'),
        //maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Item Name is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _itemname = value;
        },
      );
    }

    Widget _addDescribe() {
      return TextFormField(
        decoration: InputDecoration(
            labelText: 'Describe about item',
            hintText: 'Enter you item Describe'),
        //maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Item Describe is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _itemname = value;
        },
      );
    }

    Widget _buildName() {
      return TextFormField(
        decoration:
            InputDecoration(labelText: 'Your Name', hintText: 'Enter you Name'),
        //maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Your Name is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _name = value;
        },
      );
    }

    Widget _buildPhoneNumber() {
      return TextFormField(
        decoration:
            InputDecoration(labelText: 'Phone number', prefixText: '+94'),
        maxLength: 9,
        keyboardType: TextInputType.phone,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Phone number is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _url = value;
        },
      );
    }

    Widget _buildEmail() {
      return TextFormField(
        decoration: InputDecoration(labelText: 'Email'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Email is Required';
          }

          if (!RegExp(
                  r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
              .hasMatch(value)) {
            return 'Please enter a valid email Address';
          }

          return null;
        },
        onSaved: (String value) {
          _email = value;
        },
      );
    }

    //return Container();
  }
}
