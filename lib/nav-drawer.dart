import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Splash/logo_screen.dart';
import 'package:flutter_application_1/StatPage.dart';
import 'package:flutter_application_1/Splash/logo_screen.dart';

import'package:flutter_application_1/Authentication/who.dart';
class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          DrawerHeader(
            child: Text(
              ' ',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage('assets/ff.png'))),
          ),
          SizedBox(height: 40),
          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text(
              'Statistics',
              textScaleFactor: 2.0,
              style: TextStyle(color: Colors.brown, fontSize: 15.0),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => StatPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(
              'Logout',
              textScaleFactor: 2.0,
              style: TextStyle(color: Colors.brown, fontSize: 15.0),
            ),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => who()));
            },
          ),
        ],
      ),
    );
  }
}
