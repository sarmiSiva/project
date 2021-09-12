/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
//import 'package:project_s/addItem/form_screen.dart';
//import 'package:project_s/addItem/AddItemdb.dart';
import 'package:project_s/chat/chatmain.dart';
import 'package:project_s/constants.dart';
import 'package:project_s/page/MainGridList.dart';
import 'package:project_s/page/contactus.dart';

class indexApp extends StatefulWidget {
  //const indexApp({ Key? key }) : super(key: key);

  @override
  _indexAppState createState() => _indexAppState();
}

class _indexAppState extends State<indexApp> {
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

  signOut() async {
    _auth.signOut();

    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: new AppBar(
            /*
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        */
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/img.png',
                  fit: BoxFit.contain,
                  height: 32,
                ),
                Container(
                    padding: const EdgeInsets.all(8.0), child: Text('eBin'))
              ],
            ),
            backgroundColor: kPrimaryColor,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Add Item",
                  icon: Icon(Icons.add),
                ),
                Tab(
                  text: "History",
                  icon: Icon(Icons.history),
                ),
              ],
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  signOut();
                },
              ),
            ],
          ),
          body: Container(
            child: !isloggedin
                ? CircularProgressIndicator()
                : TabBarView(
                    children: [
                      Center(child: Text('Tab1')),
                      //imgMyApp(),
                      //AddUser('abc', 'abc', 'abc', 'abc', 'abc'),
                      Center(child: Text('Tab2')),
                    ],
                  ),
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(
                Icons.chat,
                size: 32,
              ),
              backgroundColor: kPrimaryColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyAppChat()),
                );
              }),
          drawer: Drawer(
            elevation: 50.0,
            child: Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text('${user.displayName}'),
                  accountEmail: Text('${user.email}'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text('xyz'),
                  ),
                ),
                ListTile(
                  title: Text('Home'),
                  leading: Icon(Icons.home),
                  onTap: () {},
                ),
                Divider(
                  height: 0.2,
                ),
                ListTile(
                    title: Text('Profile'),
                    leading: Icon(Icons.people),
                    onTap: () {}),
                Divider(
                  height: 0.2,
                ),
                ListTile(
                    title: Text('About us'),
                    leading: Icon(Icons.contact_page),
                    onTap: () {}),
                //MainGridList
                Divider(
                  height: 0.2,
                ),
                ListTile(
                  title: Text('Save world'),
                  leading: Icon(Icons.contact_support_sharp),
                  onTap: () {
                    MainGridList();
                  },
                ),
                Divider(
                  height: 0.2,
                ),
                ListTile(
                  title: Text('Contect us'),
                  leading: Icon(Icons.contact_support_sharp),
                  onTap: () {
                    contactus();
                  },
                ),
                Divider(
                  height: 0.2,
                ),
                ListTile(
                  title: Text('LogOut'),
                  leading: Icon(Icons.logout_sharp),
                  onTap: signOut(),
                ),
                Divider(
                  height: 0.2,
                ),
                ListTile(
                  title: Text('Setting'),
                  leading: Icon(Icons.settings),
                ),
                Divider(
                  height: 0.2,
                ),
              ],
            ),
          ),
        ),
      );
}
*/
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:project_s/addItem/form_screen.dart';
import 'package:project_s/chat/chatmain.dart';
import 'package:project_s/constants.dart';
import 'package:project_s/imgclass/imgClassMyHomePage.dart';
import 'package:project_s/page/contactus.dart';
import 'package:project_s/page/details.dart';

class indexApp extends StatefulWidget {
  //const indexApp({ Key? key }) : super(key: key);

  @override
  _indexAppState createState() => _indexAppState();
}

class _indexAppState extends State<indexApp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;
  String userName = '';
  String userEmail = '';

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
      userName = user.displayName;
      userEmail = user.email;
    }
  }

  signOut() async {
    _auth.signOut();

    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: new AppBar(
            /*
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        */
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/img.png',
                  fit: BoxFit.contain,
                  height: 32,
                ),
                Container(
                    padding: const EdgeInsets.all(8.0), child: Text('eBin'))
              ],
            ),
            backgroundColor: kPrimaryColor,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Add Item",
                  icon: Icon(Icons.add),
                ),
                Tab(
                  text: "History",
                  icon: Icon(Icons.history),
                ),
              ],
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  signOut();
                },
              ),
            ],
          ),
          body: Container(
            child: !isloggedin
                ? CircularProgressIndicator()
                : TabBarView(
                    children: [
                      FormScreen(),
                      //imgClassMyHomePage(),
                      Center(child: Text('Tab1')),
                    ],
                  ),
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(
                Icons.chat,
                size: 32,
              ),
              backgroundColor: kPrimaryColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyAppChat()),
                );
              }),
          drawer: Drawer(
            elevation: 50.0,
            child: Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(userName),
                  accountEmail: Text(userEmail),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text('xyz'),
                  ),
                ),
                ListTile(
                  title: Text('Home'),
                  leading: Icon(Icons.home),
                  onTap: () {
                    indexApp();
                  },
                ),
                Divider(
                  height: 0.2,
                ),
                ListTile(
                  title: Text('Profile'),
                  leading: Icon(Icons.people),
                  onTap: () {},
                ),
                Divider(
                  height: 0.2,
                ),
                ListTile(
                  title: Text('About & Contect us'),
                  leading: Icon(Icons.contact_page),
                  onTap: () {
                    contactus();
                  },
                ),
                Divider(
                  height: 0.2,
                ),
                ListTile(
                  title: Text('Save world'),
                  leading: Icon(Icons.circle_rounded),
                  onTap: () {
                    details();
                  },
                ),
                Divider(
                  height: 0.2,
                ),
                ListTile(
                  title: Text('Setting'),
                  leading: Icon(Icons.settings),
                ),
                Divider(
                  height: 0.2,
                ),
                ListTile(
                  title: Text('LogOut'),
                  leading: Icon(Icons.logout_sharp),
                ),
                Divider(
                  height: 0.2,
                ),
                ListTile(
                  title: Text('Image'),
                  leading: Icon(Icons.image_aspect_ratio_sharp),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => imgClassMyHomePage()),
                    );
                  },
                ),
                Divider(
                  height: 0.2,
                ),
              ],
            ),
          ),
        ),
      );
}
