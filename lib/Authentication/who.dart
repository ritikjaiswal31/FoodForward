import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'hotel_login.dart';               //Hotel Login
import 'hotel_signin.dart';              //Hotel Signin
import 'ngo_login.dart';                 //NGO Login
import 'ngo_sigin.dart';                 //NGO Signin

class who extends StatelessWidget {
  const who({super.key});

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
              'Who are you?',
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
                      MaterialPageRoute(builder: (context) => NGO_Signin()));
                },
                child: Text(
                  'NGO',
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
                      MaterialPageRoute(builder: (context) => Hotel_Signin()));
                },
                child: Text(
                  'Donor',
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
