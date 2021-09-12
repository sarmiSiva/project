import 'package:flutter/material.dart';
import 'package:project_s/mlKit/DetailScreen.dart';

class mlmain extends StatefulWidget {
  @override
  _mlmainState createState() => _mlmainState();
}

class _mlmainState extends State<mlmain> {
  String _value =
      "Dear User this is for your help if you need you can scan your barcode or Text using the selector option below, just copy the details and paste them into the description section. we hope its really helpful for you.";
  List<String> itemsList = [
    'Text Scanner',
    'Barcode Scanner',
    'Label Scanner',
    'Face Detection'
  ];
  Widget buildtext() => Builder(
        builder: (context) => Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                _value,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Describe helper'),
      ),
      body: ListView.builder(
          itemCount: itemsList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(itemsList[index]),
                tileColor: Colors.green,
                focusColor: Colors.lightGreen,
                selectedTileColor: Colors.red,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(),
                      settings: RouteSettings(arguments: itemsList[index]),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
