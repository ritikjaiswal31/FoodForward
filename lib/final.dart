import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/Authentication/who.dart';
import 'StatPage.dart';

class finalpage extends StatelessWidget {
  const finalpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(child: Image.asset('assets/logo.png')),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Thank you for making your efforts count\nYour contribution will have a lasting impact, and your kindness will never be forgotten.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            child: Text("Donation Statistics"),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFe8772e),
              elevation: 0,
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => StatPage()));
            },
          ),
        ],
      ),
    );
  }
}
