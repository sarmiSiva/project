import 'package:flutter/material.dart';
import 'package:project_s/addItem/AddItemdb.dart';
import 'package:project_s/imgclass/imgClassMyHomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("start");
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }

  String _itemname;
  String _name;
  //String _email;
  //String _password;
  //String _url;
  String _phoneNumber;
  String _quantity;
  String _address;
  String _describe;

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
        _describe = value;
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
      decoration: InputDecoration(labelText: 'Phone number', prefixText: '+94'),
      maxLength: 9,
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _phoneNumber = value;
      },
    );
  }
/*
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


  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'CopanCode'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  Widget _builURL() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Url'),
      keyboardType: TextInputType.url,
      validator: (String value) {
        if (value.isEmpty) {
          return 'URL is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _url = value;
      },
    );
  }


  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
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
  */

  Widget _buildQuantity() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Quantity'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        int calories = int.tryParse(value);

        if (calories == null || calories <= 0) {
          return 'Quantity must be greater than 0';
        }

        return null;
      },
      onSaved: (String value) {
        _quantity = value;
      },
    );
  }

  Widget _addAddress() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Your Address', hintText: 'Enter you address'),
      //maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'your address is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _address = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Container(
          //margin: EdgeInsets.only(8.0, 8.0, 8.0, 0.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _additem(),
                _addDescribe(),
                _buildQuantity(),
                _buildName(),
                _addAddress(),
                _buildPhoneNumber(),
                //_buildEmail(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        AddItem(_itemname, _name, _phoneNumber, _quantity,
                            _describe, _address);
                        /*String _itemname;
                          String _name;
                          String _phoneNumber;
                          String _quantity;
                          String _address;
                          String _describe;*/
                      },
                      child: Text(
                        'Send',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.green,
                    ),
                    SizedBox(width: 20.0),
                    RaisedButton(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      onPressed: () {},
                      child: Text(
                        'Clear',
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

                /*Center(
                  child: Row(
                    children: [
                      RaisedButton(
                        child: Text(
                          'Send',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                            return;
                          }
                        },
                      ),
                      RaisedButton(
                        child: Text(
                          'Clear',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                )*/
              ],
            ),
          ),
        ),
      ),

      /*
        final String username = '${user.displayName}';
  final String useremail = '${user.email}';
      body: SingleChildScrollView(
        child: Container(
          //margin: EdgeInsets.all(24),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //DetectMain(),
                  //imgClassMyHomePage(),
                  _additem(),
                  _addDescribe(),
                  _buildName(),
                  _buildQuantity(),
                  _buildPhoneNumber(),
                  _buildEmail(),
                  //_buildPassword(),
                  //_builURL(),

                  SizedBox(height: 100),
                  Center(
                    child: Center(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              color: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              onPressed: () {
                                if (!_formKey.currentState.validate()) {
                                  return;
                                }
                                AddUser(_itemname, _name, _email, _phoneNumber,
                                    _quantity);
                                //this.itemname, this.name, this.email, this.phoneNumber, this.quantity);

                                /*_formKey.currentState.save();
                                print(_itemname);
                                print(_name);
                                print(_email);
                                print(_phoneNumber);
                                //print(_url);
                                print(_password);
                                print(_quantity);
                                */
                                //Send to API
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              color: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),*/
    );
  }
}
