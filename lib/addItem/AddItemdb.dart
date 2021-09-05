import 'package:flutter/material.dart';
// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddItem extends StatelessWidget {
  final String itemname;
  final String name;
  final String phoneNumber;
  final String quantity;
  final String itemdes;
  final String address;
  AddItem(this.itemname, this.name, this.phoneNumber, this.quantity,
      this.address, this.itemdes);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called item that references the firestore collection
    CollectionReference item = FirebaseFirestore.instance.collection('item');

    Future<void> addItem() {
      // Call the user's CollectionReference to add a new user
      return item
          .add({
            'itemname': itemname,
            'username': name,
            'phoneNumber': phoneNumber,
            'quantity': quantity,
            'address': address,
            'itemdescribe': itemdes,
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
  }
}
