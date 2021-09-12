// import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_s/addItem/AddItemdb.dart';
// import 'package:project_s/imgclass/imgClassMyHomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:tflite/tflite.dart';

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
  List _classifiedResult;
  File _imageFile;

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
    loadImageModel();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  Future loadImageModel() async {
    Tflite.close();
    String result;
    result = await Tflite.loadModel(
      model: "assets/catdog_model.tflite",
      labels: "assets/cat_dog_labels.txt",
    );
    print(result);
  }

  Future selectImage() async {
    final picker = ImagePicker();
    var image =
        await picker.getImage(source: ImageSource.gallery, maxHeight: 300);
    classifyImage(image);
  }

  Future classifyImage(image) async {
    _classifiedResult = null;
    // Run tensorflowlite image classification model on the image
    print("classification start $image");
    final List result = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    print("classification done");
    setState(() {
      if (image != null) {
        _imageFile = File(image.path);
        _classifiedResult = result;
      } else {
        print('No image selected.');
      }
    });
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(15),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border.all(color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(2, 2),
                            spreadRadius: 2,
                            blurRadius: 1,
                          ),
                        ],
                      ),
                      child: (_imageFile != null)
                          ? Image.file(_imageFile)
                          : Image.network('https://i.imgur.com/sUFH1Aq.png')),
                  RaisedButton(
                      onPressed: () {
                        selectImage();
                      },
                      child: Icon(Icons.camera)),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    child: Column(
                      children: _classifiedResult != null
                          ? _classifiedResult.map((result) {
                              return Card(
                                elevation: 0.0,
                                color: Colors.lightBlue,
                                child: Container(
                                  width: 300,
                                  margin: EdgeInsets.all(10),
                                  child: Center(
                                    child: Text(
                                      "${result["label"]} :  ${(result["confidence"] * 100).toStringAsFixed(1)}%",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              );
                            }).toList()
                          : [],
                    ),
                  ),
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
