import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_s/stageOne/login/Login.dart';

class resetpassword extends StatelessWidget {
  //const resetpassword({ Key? key }) : super(key: key);
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "REST PASSWORD",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                labelText: "Enter the email address",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
        ),
        ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance
                  .sendPasswordResetEmail(email: controller.text)
                  .then((value) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              });
            },
            child: Text("Reset Password"))
      ],
    ));
  }
}
/*

*/
