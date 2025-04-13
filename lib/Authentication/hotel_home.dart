import 'package:flutter/material.dart';

import 'package:flutter_application_1/Authentication/upload.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'contacts_ngo.dart';
import 'hotel_login.dart';
import 'hotel_signin.dart';
import 'ngo_login.dart';
import 'ngo_sigin.dart';

class hotelhome extends StatelessWidget {
  const hotelhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            /*Text(
              'Welcome to the Food Forward Community :)',
              textScaleFactor: 2.0,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.brown, fontSize: 15.0),
            ),*/
            Image.asset('assets/ff.png'),
            //SizedBox(height: 8),
            SizedBox(height: 10),
            Text(
              'What is your wish?',
              textScaleFactor: 2.0,
              style: TextStyle(color: Colors.brown, fontSize: 15.0),
            ),
            SizedBox(height: 40),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UploadScreen()));
                },
                child: Text(
                  'Upload Photos',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFe8772e),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ItemListn()));
                },
                child: Text(
                  'See Ngo',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFe8772e),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
